SELECT p.id, p.user, p.state,
       r.trx_id trx_id, r.trx_mysql_thread_id thread, r.trx_query query,
       b.trx_id blocking_trx_id, b.trx_mysql_thread_id blocking_thread, b.trx_query blocking_query
 FROM  information_schema.processlist p, information_schema.innodb_lock_waits w,
       information_schema.innodb_trx b, information_schema.innodb_trx r
 WHERE b.trx_id = w.blocking_trx_id 
   AND r.trx_id = w.requesting_trx_id
   AND p.id=r.trx_mysql_thread_id;