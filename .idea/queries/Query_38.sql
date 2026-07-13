SELECT count(*) as active_connections FROM pg_stat_activity;
select count(*), client_addr, state from pg_stat_activity group by client_addr, state;
select  count(1)  from int_segment_run isr  WHERE TO_CHAR
                                                  (start_date, 'MM-DD-YYYY') = '10-26-2024'
                                              and status ='RUNNING';
SELECT
    query,                              -- The SQL query text
    calls,                              -- Number of times the query was executed
    round(mean_time, 2) AS avg_exec_time_ms, -- Average execution time in milliseconds
    round(total_time, 2) AS total_exec_time_ms, -- Total execution time in milliseconds
    rows                                -- Total number of rows retrieved or affected
FROM
    pg_stat_statements
ORDER BY
    pg_stat_statements.queryid DESC     -- Ordering by query ID to show recent entries (descending)
LIMIT 10;