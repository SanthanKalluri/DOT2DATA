tee E:\Mahesh_Notes\Mysql\MysqlGeneric.txt

SELECT DATABASE(); 


select engine , support from information_schema.ENGINES where support = 'DEFAULT'

SELECT table_schema,
 SUM(data_length+index_length)/1024/1024 AS total_mb,
 SUM(data_length)/1024/1024 AS data_mb,
 SUM(index_length)/1024/1024 AS index_mb,
 COUNT(*) AS tables,
 CURDATE() AS today
FROM information_schema.tables
GROUP BY table_schema
ORDER BY 2 DESC;

select @@GLOBAL.KEY_BUFFER_SIZE + @@GLOBAL.INNODB_BUFFER_POOL_SIZE + @@GLOBAL.INNODB_LOG_BUFFER_SIZE + @@GLOBAL.INNODB_ADDITIONAL_MEM_POOL_SIZE + @@GLOBAL.NET_BUFFER_LENGTH as GLOBAL_BUFFER_SIZE, 
@@GLOBAL.SORT_BUFFER_SIZE + @@GLOBAL.MYISAM_SORT_BUFFER_SIZE + @@GLOBAL.READ_BUFFER_SIZE + @@GLOBAL.JOIN_BUFFER_SIZE + @@GLOBAL.READ_RND_BUFFER_SIZE as THREAD_BUFFER_SIZE,
 @@GLOBAL.KEY_BUFFER_SIZE + @@GLOBAL.INNODB_BUFFER_POOL_SIZE + @@GLOBAL.INNODB_LOG_BUFFER_SIZE + @@GLOBAL.INNODB_ADDITIONAL_MEM_POOL_SIZE + @@GLOBAL.NET_BUFFER_LENGTH + (@@GLOBAL.SORT_BUFFER_SIZE + @@GLOBAL.MYISAM_SORT_BUFFER_SIZE + @@GLOBAL.READ_BUFFER_SIZE + @@GLOBAL.JOIN_BUFFER_SIZE + @@GLOBAL.READ_RND_BUFFER_SIZE) * @@GLOBAL.MAX_CONNECTIONS AS TOTAL_MEMORY_SIZE, 
(@@GLOBAL.KEY_BUFFER_SIZE + @@GLOBAL.INNODB_BUFFER_POOL_SIZE + @@GLOBAL.INNODB_LOG_BUFFER_SIZE + @@GLOBAL.INNODB_ADDITIONAL_MEM_POOL_SIZE + @@GLOBAL.NET_BUFFER_LENGTH + (@@GLOBAL.SORT_BUFFER_SIZE + @@GLOBAL.MYISAM_SORT_BUFFER_SIZE + @@GLOBAL.READ_BUFFER_SIZE + @@GLOBAL.JOIN_BUFFER_SIZE + @@GLOBAL.READ_RND_BUFFER_SIZE) * @@GLOBAL.MAX_CONNECTIONS)/1024 AS TOTAL_MEMORY_SIZE_kb,
 (@@GLOBAL.KEY_BUFFER_SIZE + @@GLOBAL.INNODB_BUFFER_POOL_SIZE + @@GLOBAL.INNODB_LOG_BUFFER_SIZE + @@GLOBAL.INNODB_ADDITIONAL_MEM_POOL_SIZE + @@GLOBAL.NET_BUFFER_LENGTH + (@@GLOBAL.SORT_BUFFER_SIZE + @@GLOBAL.MYISAM_SORT_BUFFER_SIZE + @@GLOBAL.READ_BUFFER_SIZE + @@GLOBAL.JOIN_BUFFER_SIZE + @@GLOBAL.READ_RND_BUFFER_SIZE) * @@GLOBAL.MAX_CONNECTIONS)/1024/1024 AS TOTAL_MEMORY_SIZE_mb,
 (@@GLOBAL.KEY_BUFFER_SIZE + @@GLOBAL.INNODB_BUFFER_POOL_SIZE + @@GLOBAL.INNODB_LOG_BUFFER_SIZE + @@GLOBAL.INNODB_ADDITIONAL_MEM_POOL_SIZE + @@GLOBAL.NET_BUFFER_LENGTH + (@@GLOBAL.SORT_BUFFER_SIZE + @@GLOBAL.MYISAM_SORT_BUFFER_SIZE + @@GLOBAL.READ_BUFFER_SIZE + @@GLOBAL.JOIN_BUFFER_SIZE + @@GLOBAL.READ_RND_BUFFER_SIZE) * @@GLOBAL.MAX_CONNECTIONS)/1024/1024/1024 AS TOTAL_MEMORY_SIZE_gb



select QUERY, TRACE from information_schema.OPTIMIZER_TRACE

SELECT p.id, p.user, p.state,
       r.trx_id trx_id, r.trx_mysql_thread_id thread, r.trx_query query,
       b.trx_id blocking_trx_id, b.trx_mysql_thread_id blocking_thread, b.trx_query blocking_query
 FROM  information_schema.processlist p, information_schema.innodb_lock_waits w,
       information_schema.innodb_trx b, information_schema.innodb_trx r
 WHERE b.trx_id = w.blocking_trx_id 
   AND r.trx_id = w.requesting_trx_id
   AND p.id=r.trx_mysql_thread_id;


select a.table_schema, a.table_name, a.data_length, b.index_name, b.cardinality from information_schema.tables a, information_schema.statistics b
where a.engine in ('InnoDB', 'ISAM') AND a.table_schema NOT IN
 ('information_schema','performance_schema','mysql') and
 a.table_schema='TRMTESTDB' and 
a.table_name = b.table_name  ORDER BY b.cardinality desc;

notee






