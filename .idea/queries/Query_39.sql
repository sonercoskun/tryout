SELECT count(*) as active_connections
FROM pg_stat_activity;
select count(*), client_addr, state from pg_stat_activity group by client_addr, state;
select  count(1)  from int_segment_run isr  WHERE TO_CHAR
                                                  (start_date, 'MM-DD-YYYY') = '10-25-2024'
                                              and status ='RUNNING';