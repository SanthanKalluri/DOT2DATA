SELECT NOW(), VERSION();
SELECT table_schema,
 SUM(data_length+index_length)/1024/1024 AS total_mb,
 SUM(data_length)/1024/1024 AS data_mb,
 SUM(index_length)/1024/1024 AS index_mb,
 COUNT(*) AS tables,
 CURDATE() AS today
FROM information_schema.tables
GROUP BY table_schema
ORDER BY 2 DESC;
# Set a session variable for the largest schema for later use
SELECT @schema := table_schema,
 SUM(data_length+index_length)/1024/1024 AS total_mb
FROM information_schema.tables
GROUP BY table_schema
ORDER BY 2 DESC
LIMIT 1;