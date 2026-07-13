SELECT datname, pid, state, query, age(clock_timestamp(), query_start) AS age
FROM pg_stat_activity
WHERE state <> 'idle'
  AND query NOT LIKE '% FROM pg_stat_activity %'
ORDER BY age;


SELECT table_name
FROM information_schema.tables
WHERE table_type = 'BASE TABLE'
  AND table_schema = 'evam' and table_name not like 'int%'
  and table_name not like '%backup%' and table_name not like '%_table%';

select * from c000008700_comm;