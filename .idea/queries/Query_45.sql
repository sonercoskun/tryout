SELECT
    pid,
    now() - pg_stat_activity.query_start AS duration,
    query,
    state
FROM pg_stat_activity
WHERE (now() - pg_stat_activity.query_start) > interval '5 minutes';

select count(*) from orphantablo;

SELECT datname, pid, state, query, age(clock_timestamp(), query_start) AS age
FROM pg_stat_activity
WHERE state <> 'idle'
  AND query NOT LIKE '% FROM pg_stat_activity %'
ORDER BY age;

SELECT pid, now() - pg_stat_activity.query_start AS duration, query
FROM pg_stat_activity
WHERE (now() - pg_stat_activity.query_start) > interval '2 minutes';

SELECT pg_stat_activity.pid, relation::regclass, mode, granted
FROM pg_locks
         JOIN pg_stat_activity ON pg_locks.pid = pg_stat_activity.pid;

select * from orphantablo;

