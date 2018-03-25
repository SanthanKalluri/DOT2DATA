CREATE OR REPLACE
PACKAGE BODY sec_data_pkg
  AS
  FUNCTION mask_national_id(
      p_owner IN VARCHAR2,
      p_name  IN VARCHAR2 )
    RETURN VARCHAR2
  AS
  BEGIN
    IF sys_context( 'userenv', 'session_user' ) = 'DMASKING' THEN
      RETURN NULL;
    ELSE
      RETURN '1=0';
    END IF;
  END;
END sec_data_pkg;