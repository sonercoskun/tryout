select scenario_name, count(scenario_name) from int_log_table group by scenario_name order by count(scenario_name) desc;
select count(actorid) from Hopi_3_table;
select * from int_scenario_def where scenario_name = 'test';
select * from int_scenario_version where scenario_name = 'test';
select * from test_table;
select max(id) from int_scenario_def;
select lo_get(24634404);
select * from pg_largeobject where loid = 24634404;
select * from int_log_table where scenario_name = 'Hopi_4' order by log_time desc;
select * from int_event_stat where day_of_date = '20241228' order by count desc;
select * from int_log_table;
select date_trunc('day',current_timestamp);
select * from int_operation_log;
select * from int_offer_report;


select distinct(actorid) from int_log_table where state='Tiklayanlar';
select distinct(actorid) from int_log_table where state='Rejected';

SELECT datname, pid, state, query, age(clock_timestamp(), query_start) AS age
FROM pg_stat_activity
WHERE state <> 'idle'
  AND query NOT LIKE '% FROM pg_stat_activity %'
ORDER BY age;

select * from int_scen_event_def where event_name ='PurchaseEvent';