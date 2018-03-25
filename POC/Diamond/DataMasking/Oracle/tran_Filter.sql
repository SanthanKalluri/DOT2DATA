CREATE OR REPLACE FUNCTION 
   DMASKING.tran_Filter 
   (schema IN varchar2, tab IN varchar2)
  RETURN VARCHAR2 AS
BEGIN
  IF sys_context( 'userenv', 'session_user' ) = 'DMASKING' THEN
      RETURN NULL;
  ELSE
    RETURN 
   'passport_no <> ''NYSC''';
  END IF; 
END tran_Filter;