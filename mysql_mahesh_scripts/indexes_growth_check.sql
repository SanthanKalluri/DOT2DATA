select a.table_schema, a.table_name, a.data_length, b.index_name, b.cardinality from information_schema.tables a, information_schema.statistics b
where a.engine in ('InnoDB', 'ISAM') AND a.table_schema NOT IN
 ('information_schema','performance_schema','mysql') and
a.table_name = b.table_name  ORDER BY b.cardinality desc;