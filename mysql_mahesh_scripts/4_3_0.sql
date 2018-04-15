/*-----dbrequest #244----- */
/* alter table srvc_enty add entity_reference_id  varchar(50);
/*-----End dbrequest #244-----
/*-----dbrequest #245-----
CREATE TABLE business_entity_carrier (
    id              		bigint(20) 			 AUTO_INCREMENT NOT NULL,
    be_id			bigint(20)					NOT NULL,	
    carrier_code          	varchar(50) 					    NULL,
    account_no          	varchar(100) 					    NULL,
    is_default   		char(1) 					    NULL,
    is_active			char(1)						    NULL,
    carrier_attr_1		varchar(50) 					    NULL,
    carrier_attr_2		varchar(50) 					    NULL,
    carrier_attr_3		varchar(100) 					    NULL,
    carrier_attr_4		varchar(100) 					    NULL,
    discriminator		varchar(50) 					    NULL,
    created_by       		bigint(20) 					    NULL,
    updated_by       		bigint(20) 					    NULL,
    created_date     		datetime 					    NULL,
    updated_date     		datetime 					    NULL,
    created_by_user  		varchar(250) 					    NULL,
    updated_by_user  		varchar(250) 					    NULL,
    PRIMARY KEY(id)
);

ALTER TABLE business_entity_carrier
    ADD CONSTRAINT becarr_beid_fk
	FOREIGN KEY(be_id)
	REFERENCES business_entity(id);
-----End dbrequest #245-----
-----dbrequest #246----- 
alter table mize_job_instance_schedule add schedule_defn longtext;  
-----End dbrequest #246-----
-----dbrequest #248----- 
CREATE TABLE report (
    id              		bigint(20) 			 AUTO_INCREMENT NOT NULL,
    tenant_id			bigint(20)					    NULL,	
    code			varchar(100) 					    NULL,
    category          		varchar(50) 					    NULL,
    is_active			char(1)						    NULL,
    url				varchar(500) 					    NULL,
    output_format		varchar(50) 					    NULL,
    created_by       		bigint(20) 					    NULL,
    updated_by       		bigint(20) 					    NULL,
    created_date     		datetime 					    NULL,
    updated_date     		datetime 					    NULL,
    created_by_user  		varchar(250) 					    NULL,
    updated_by_user  		varchar(250) 					    NULL,
    PRIMARY KEY(id)
);  report Table already exists 



CREATE TABLE report_attribute (
    id              		bigint(20) 			 AUTO_INCREMENT NOT NULL,
    report_id			bigint(20)					NOT NULL,	
    name 			varchar(100)					    NULL,
    to_name 			varchar(100)					    NULL,
    label 			varchar(100)					    NULL,
    type 			varchar(50)					    NULL,
    alignment 			varchar(50)					    NULL,
    is_required 		char(1)						DEFAULT 'N',
    is_active 			char(1) 					DEFAULT 'Y',
    is_hidden 			char(1) 					DEFAULT 'N',
    is_multivalue		char(1) 					DEFAULT 'N',
    default_value		varchar(100)					    NULL,
    display_type   		varchar(50)					    NULL,
    display_reference   	varchar(500)					    NULL,
    display_order		int(11)						    NULL,
    display_group 		varchar(100)					    NULL,
    callback_fn			varchar(100)					    NULL,
    message 			varchar(100)					    NULL,
    created_by       		bigint(20) 					    NULL,
    updated_by       		bigint(20) 					    NULL,
    created_date     		datetime 					    NULL,
    updated_date     		datetime 					    NULL,
    created_by_user  		varchar(250) 					    NULL,
    updated_by_user  		varchar(250) 					    NULL,
    PRIMARY KEY(id)
);



ALTER TABLE report_attribute
    ADD CONSTRAINT rprta_rprtid_fk
	FOREIGN KEY(report_id)
	REFERENCES report(id);






CREATE TABLE report_template (
    id              		bigint(20) 			 AUTO_INCREMENT NOT NULL,
    report_id			bigint(20)					NOT NULL,	
    tenant_id			bigint(20)					    NULL,
    name 			varchar(250)					    NULL,
    description 		varchar(500)					    NULL,
    output_format		varchar(50) 					    NULL,
    criteria_defn   		varchar(5000) 					    NULL,  
    status			varchar(50)	 				    NULL, 
    job_instance_id		bigint(20)				            NULL,
    created_by       		bigint(20) 					    NULL,
    updated_by       		bigint(20) 					    NULL,
    created_date     		datetime 					    NULL,
    updated_date     		datetime 					    NULL,
    created_by_user  		varchar(250) 					    NULL,
    updated_by_user  		varchar(250) 					    NULL,
    PRIMARY KEY(id)
);

ALTER TABLE report_template
    ADD CONSTRAINT rprtt_rprtid_fk
	FOREIGN KEY(report_id)
	REFERENCES report(id);

ALTER TABLE report_template
    ADD CONSTRAINT rprtt_jobinstid_fk
	FOREIGN KEY(job_instance_id)
	REFERENCES mize_job_instance(id);


CREATE TABLE report_template_to_be (
    id              		bigint(20) 			 AUTO_INCREMENT NOT NULL,
    template_id			bigint(20)					NOT NULL,	
    be_id 			bigint(20)				            NULL,
    be_type			varchar(50) 					    NULL,
    be_code			varchar(50) 					    NULL,
    be_name			varchar(500) 					    NULL,
    PRIMARY KEY(id)
);

ALTER TABLE report_template_to_be
    ADD CONSTRAINT rprttb_tmpltid_fk
	FOREIGN KEY(template_id)
	REFERENCES report_template(id);

ALTER TABLE report_template_to_be
    ADD CONSTRAINT rprttb_beid_fk
	FOREIGN KEY(be_id)
	REFERENCES business_entity(id);

CREATE TABLE report_template_to_user (
    id              		bigint(20) 			 AUTO_INCREMENT NOT NULL,
    template_id			bigint(20)					NOT NULL,	  
    user_id 			bigint(20)				            NULL,
    login_id			varchar(50) 					    NULL,
    user_name			varchar(500) 					    NULL, 
    PRIMARY KEY(id)
);

ALTER TABLE report_template_to_user
    ADD CONSTRAINT rprttu_tmpltid_fk
	FOREIGN KEY(template_id)
	REFERENCES report_template(id);

ALTER TABLE report_template_to_user
    ADD CONSTRAINT rprttu_userid_fk
	FOREIGN KEY(user_id)
	REFERENCES users(id); */
/*
CREATE TABLE report_log (
    id              		bigint(20) 			 AUTO_INCREMENT NOT NULL,
    template_id			bigint(20)					NOT NULL,   
    log_date			datetime				            NULL,
    status			varchar(50)	 				    NULL, 
    file_name			varchar(250)	 				    NULL, 
    file_url			varchar(500)	 				    NULL, 
    message			varchar(500)	 				    NULL, 	
    created_by       		bigint(20) 					    NULL,
    updated_by       		bigint(20) 					    NULL,
    created_date     		datetime 					    NULL,
    updated_date     		datetime 					    NULL,
    created_by_user  		varchar(250) 					    NULL,
    updated_by_user  		varchar(250) 					    NULL,
    PRIMARY KEY(id)
);

ALTER TABLE report_log
    ADD CONSTRAINT rprtl_tmpltid_fk
	FOREIGN KEY(template_id)
	REFERENCES report_template(id);

-----End dbrequest #248-----
-----dbrequest #249-----

alter table mize_job add job_category varchar(50);

alter table mize_job_instance modify instance_name varchar(250);
alter table mize_job_instance modify job_status varchar(50);
alter table mize_job_instance modify is_active char(1) default 'Y';

drop table mize_job_sch;

alter table mize_job_execution add status varchar(50);
alter table mize_job_execution add message varchar(500);
*/

set foreign_key_checks=0;
ALTER TABLE mize_job_execution
    ADD CONSTRAINT fk_instanceid_mje
	FOREIGN KEY(instance_id)
	REFERENCES mize_job_instance(id);
set foreign_key_checks=1;

/*-----End dbrequest #249-----*/
/*-----dbrequest #250-----*/
CREATE TABLE entity_hotspots (
    id              		bigint(20) 			 AUTO_INCREMENT NOT NULL,
    tenant_id			bigint(20)					    NULL,	
    name          		varchar(100) 					    NULL,
    entity_type 		varchar(50)					    NULL,
    entity_class		varchar(200)					    NULL,
    entity_defn			varchar(1000)					    NULL,
    field_path   		varchar(500) 					    NULL,
    is_active			char(1)						    NULL,
    created_by       		bigint(20) 					    NULL,
    updated_by       		bigint(20) 					    NULL,
    created_date     		datetime 					    NULL,
    updated_date     		datetime 					    NULL,
    created_by_user  		varchar(250) 					    NULL,
    updated_by_user  		varchar(250) 					    NULL,
    PRIMARY KEY(id)
);
/*-----End dbrequest #250-----*/
/*-----dbrequest #251-----*/
CREATE TABLE notification (
    id              		bigint(20) 			 AUTO_INCREMENT NOT NULL,
    tenant_id			bigint(20)					    NULL,	
    code          		varchar(100) 					    NULL,
    format			varchar(50) 					    NULL,
    from_email			varchar(100)					    NULL,  
    to_email			varchar(500)					    NULL, 
    cc_email			varchar(500)					    NULL,
    priority			varchar(50)					    NULL,  
    category 			varchar(50)					    NULL,   
    is_active			char(1)						DEFAULT 'Y',    
    created_by       		bigint(20) 					    NULL,
    updated_by       		bigint(20) 					    NULL,
    created_date     		datetime 					    NULL,
    updated_date     		datetime 					    NULL,
    created_by_user  		varchar(250) 					    NULL,
    updated_by_user  		varchar(250) 					    NULL,
    PRIMARY KEY(id)
);
CREATE TABLE notification_intl (
    id              		bigint(20) 			 AUTO_INCREMENT NOT NULL,
    notification_id		bigint(20)					NOT NULL,	
    locale_id			int(11)						    NULL,
    name          		varchar(250) 					    NULL,
    description          	varchar(500) 					    NULL,
    PRIMARY KEY(id)
);
ALTER TABLE notification_intl
    ADD CONSTRAINT ntfi_ntfctnid_fk
	FOREIGN KEY(notification_id)
	REFERENCES notification(id);

ALTER TABLE notification_intl
    ADD CONSTRAINT ntfi_localeid_fk
	FOREIGN KEY(locale_id)
	REFERENCES locale(locale_id);


CREATE TABLE notification_defn (
    id              		bigint(20) 			 AUTO_INCREMENT NOT NULL,
    notification_id		bigint(20)					NOT NULL,	
    locale_id			int(11)						    NULL,
    subject			varchar(500) 					    NULL,
    body			longtext 					    NULL,
    signature			longtext 					    NULL,   
    PRIMARY KEY(id)
);

ALTER TABLE notification_defn
    ADD CONSTRAINT ntfd_ntfctnid_fk
	FOREIGN KEY(notification_id)
	REFERENCES notification(id);

ALTER TABLE notification_defn
    ADD CONSTRAINT ntfd_localeid_fk
	FOREIGN KEY(locale_id)
	REFERENCES locale(locale_id);
/*-----End dbrequest #251-----*/
/*-----dbrequest #252-----*/
CREATE TABLE hotspot_mapping (
    id              		bigint(20) 			 AUTO_INCREMENT NOT NULL,
    tenant_id			bigint(20)					    NULL,	
    entity_type 		varchar(50)					    NULL,
    entity_class		varchar(200)					    NULL,
    entity_criteria		varchar(1000)					    NULL,
    created_by       		bigint(20) 					    NULL,
    updated_by       		bigint(20) 					    NULL,
    created_date     		datetime 					    NULL,
    updated_date     		datetime 					    NULL,
    created_by_user  		varchar(250) 					    NULL,
    updated_by_user  		varchar(250) 					    NULL,
    PRIMARY KEY(id)
);


CREATE TABLE hotspot_field_mapping (
    id              		bigint(20) 			 AUTO_INCREMENT NOT NULL,
    hotspot_id			bigint(20)					    NULL,	
    name          		varchar(100) 					    NULL,   
    method_name			varchar(200) 					    NULL,   
    field_name   		varchar(200) 					    NULL,
    field_criteria		varchar(1000)					    NULL,
    is_active			char(1)					     DEFAULT 'Y',
    is_based_on_locale		char(1)					     DEFAULT 'N',
    created_by       		bigint(20) 					    NULL,
    updated_by       		bigint(20) 					    NULL,
    created_date     		datetime 					    NULL,
    updated_date     		datetime 					    NULL,
    created_by_user  		varchar(250) 					    NULL,
    updated_by_user  		varchar(250) 					    NULL,
    PRIMARY KEY(id)
);

ALTER TABLE hotspot_field_mapping
    ADD CONSTRAINT hfm_hotspotid_fk
	FOREIGN KEY(hotspot_id)
	REFERENCES hotspot_mapping(id);
/*-----End dbrequest #252-----*/
/*-----dbrequest #253-----*/
alter table form_defn add form_category varchar(50);

alter table insp_form add insp_category varchar(50);
/*-----End dbrequest #253-----*/
/*-----dbrequest #254-----*/
alter table report_log add be_id 			bigint(20);
alter table report_log add be_type			varchar(50);
alter table report_log add be_code			varchar(50);
alter table report_log add be_name			varchar(500);
alter table report_log add user_id 		bigint(20);
alter table report_log add login_id		varchar(50);
alter table report_log add user_name		varchar(500);
alter table report_log add criteria_defn   	varchar(5000);
alter table report_log add output_format		varchar(50);

ALTER TABLE report_log
    ADD CONSTRAINT rprtl_userid_fk
	FOREIGN KEY(user_id)
	REFERENCES users(id);

ALTER TABLE report_log
    ADD CONSTRAINT rprtl_beid_fk
	FOREIGN KEY(be_id)
	REFERENCES business_entity(id);

/*-----dbrequest #254-----
-----dbrequest #255-----*/
alter table hotspot_field_mapping add solr_field_name varchar(100);
-----End dbrequest #255-----
-----dbrequest #256-----
alter table notification add type varchar(50);
/*-----End dbrequest #256-----
-----dbrequest #257-----*/
alter table hotspot_mapping add entity_core varchar(50);
/*-----End dbrequest #257-----
-----dbrequest #260-----*/
alter table notification add reference varchar(250);
alter table notification add include_attachments char(1) default 'N';
alter table notification add entity_as_attachment char(1) default 'N';
alter table notification add attachment_type varchar(50);

CREATE TABLE notification_link (
    id              		bigint(20) 			 AUTO_INCREMENT NOT NULL,
    notification_id		bigint(20)					NOT NULL,	
    entity_type			varchar(50) 					    NULL,
    entity_status		varchar(50) 					    NULL,
    entity_criteria		longtext 					    NULL,
    include_attachments		char(1) 				     DEFAULT 'N',
    entity_as_attachment	char(1) 				     DEFAULT 'N',
    attachment_type		varchar(50) 					    NULL,
    PRIMARY KEY(id)
);

ALTER TABLE notification_link
    ADD CONSTRAINT ntfl_ntfctnid_fk
	FOREIGN KEY(notification_id)
	REFERENCES notification(id)

/*-----End dbrequest #260-----
-----dbrequest #261-----*/
alter table report_template add notification_id bigint(20);


ALTER TABLE report_template
    
	ADD CONSTRAINT rprtt_ntfctnid_fk
	
	FOREIGN KEY(notification_id)
	
	REFERENCES notification(id);

/*-----End dbrequest #261-----
-----dbrequest #264-----*/
drop table entity_hotspots
/*-----End dbrequest #264-----
-----dbrequest #265----- */
alter table purchase_order_shipment add bill_to varchar(50);

alter table shipment_tracking add bill_to varchar(50);
/*-----End dbrequest #265-----*/
