spool user_create.out

CREATE USER dpradmin IDENTIFIED BY Dpr4321
DEFAULT TABLESPACE USERS
TEMPORARY TABLESPACE TEMP
;

GRANT "RESOURCE" TO dpradmin ;

GRANT "CONNECT" TO dpradmin ;

GRANT dba TO dpradmin WITH ADMIN OPTION;



create user tbaadm identified by Temp1234 default tablespace users temporary tablespace temp;
GRANT "RESOURCE" TO TBAADM  ;

GRANT "CONNECT" TO TBAADM ;

GRANT dba TO TBAADM WITH ADMIN OPTION;

CREATE USER CUSTOM  IDENTIFIED BY Temp1234
DEFAULT TABLESPACE users
TEMPORARY TABLESPACE TEMP
;

GRANT "RESOURCE" TO CUSTOM  ;

GRANT "CONNECT" TO CUSTOM ;

GRANT dba TO CUSTOM WITH ADMIN OPTION;

----> Connect as TBAADM and run below queries
Create Table HTD
 ( ACID int, TRAN_ID varchar2(50), TRAN_DATE Date, TRAN_RMKS varchar2(50), primary key (ACID));
 
Create Table HTH
 ( ACID int, TRAN_ID varchar2(50), TRAN_DATE Date,  primary key (ACID));

Create Table DTD
 ( ACID int, TRAN_ID varchar2(50), TRAN_DATE Date, TRAN_RMKS varchar2(50), primary key (ACID));

Create Table DTH
 ( ACID int, TRAN_ID varchar2(50), TRAN_DATE Date,  primary key (ACID));

Create Table AAC
 ( ACID int );
 
Create Table TAC
 ( TRAN_ID varchar2(50), TRAN_DATE Date );

Create Table GAM
 ( ACID int, FORACID int, ACCT_NAME varchar2(100));
 
------> connect as CUSTOM and run below queries
Create Table PS_VALIDATE
 ( FORACID int);

 --------------> Connect as TBAADM and run this queries
 insert into HTD values (015227,'M37', '25-Mar-2013', 'Salary');
insert into HTD values (015230,'M36', '23-Mar-2013', 'Salary');
insert into HTD values (015231,'M35', '23-Mar-2013', 'Salary');
insert into HTD values (015232,'M34', '23-Mar-2013', 'Salary');
commit;

-----------------> Connect as DBA user and Run
CREATE OR REPLACE FUNCTION 
   tran_Filter 
   (schema IN varchar2, tab IN varchar2)
  RETURN VARCHAR2 AS
BEGIN
  RETURN 
   'trim(tran_id)<>''M37'' and tran_date <> ''25-Mar-2013''';
END tran_Filter;



BEGIN
     DBMS_RLS.add_policy(object_schema=>'TBAADM', 
                         object_name=>'HTD',
                         policy_name=>'restrict_sal_policy',
                         policy_function=>'tran_Filter'
                         );

END;
/
------ From Now onwards you won't be able to view ACID=015227 record values, it can be viewed using "sys" user.


 
