BEGIN
           DBMS_RLS.ADD_POLICY(object_schema=>user, object_name=>'sttm_cust_personal',
                               policy_name=>'SECURE_NATIONAL_ID',
                               function_schema=>user,
                               policy_function=>'sec_data_pkg.mask_national_id',
                               sec_relevant_cols=>'p_national_id',
                               sec_relevant_cols_opt=>dbms_rls.ALL_ROWS);
END;

BEGIN
  SYS.DBMS_RLS.ADD_POLICY     (
    object_schema          => 'DMASKING'
    ,object_name           => 'STTM_CUST_PERSONAL'
    ,policy_name           => 'SECURE_PASSPORT_NO'
    ,function_schema       => 'DMASKING'
    ,policy_function       => 'TRAN_FILTER'
    ,statement_types       => 'SELECT,INSERT,UPDATE,DELETE'
    ,policy_type           => dbms_rls.dynamic
    ,long_predicate        => FALSE
    ,update_check          => FALSE
    ,static_policy         => FALSE
    ,enable                => TRUE );
END;

BEGIN
  SYS.DBMS_RLS.DROP_POLICY (
    object_schema    => 'DMASKING'
    ,object_name     => 'STTM_CUST_PERSONAL'
    ,policy_name     => 'SECURE_PASSPORT_NO');
END;

BEGIN
  SYS.DBMS_RLS.DROP_POLICY (
    object_schema    => 'DMASKING'
    ,object_name     => 'STTM_CUST_PERSONAL'
    ,policy_name     => 'SECURE_NATIONAL_ID');
END;