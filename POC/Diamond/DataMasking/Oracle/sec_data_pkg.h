CREATE OR REPLACE
PACKAGE sec_data_pkg
AS
FUNCTION mask_national_id(
    p_owner IN VARCHAR2,
    p_name  IN VARCHAR2 )
  RETURN VARCHAR2;
END sec_data_pkg;