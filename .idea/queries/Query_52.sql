select * from int_segment where code ='SGMNT_7EPII';
select * from segment_schedule where segment_code = 'SGMNT_OHLLP';
select * from int_segment_run where status = 'RUNNING';
select * from int_segment_run where start_date between '2025-03-07 00:00:00.000000' and '2025-03-07 23:00:00.000000' and status ='FINISHED' order by start_date;
select * from int_segment_run;
select * from int_segment where cron is not null;
select * from int_custom_communication_def where name='testsoner1';
select lo_get(704847926);