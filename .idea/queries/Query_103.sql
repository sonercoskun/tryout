select * from int_scenario_def where scenario_name='KIGILI_BANAOZEL_copy';
select * from int_scenario_version where scenario_name='KIGILI_BANAOZEL_copy';
select * from int_event_stat where day_of_date = '20241225' order by count desc;

SELECT scenario_name, count(*) FROM v_all_scenario_states group by scenario_name order by count(*) desc;
SELECT scenario_name, last_state, count(*) FROM v_all_scenario_states group by scenario_name, last_state order by count(*) desc;

