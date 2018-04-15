select concat('OPTIMIZE NO_WRITE_TO_BINLOG TABLE ',table_schema,'.',table_name,';') 
/* into outfile 'D:\mysql_mahesh_scripts\Optimize_all_tables.sql'  */ from information_schema.tables where table_schema = 'TRMBPDB_NEW' 
and table_type = 'base table';