select sum(int_event_stat.count) from int_event_stat where update_time > '2024-11-08 15:14:00.000000';
select event_name, int_event_stat.count from int_event_stat where day_of_date = '20241108'
                                                            and update_time > '2024-08-03 14:00:00.000000'
                                                            group by event_name, int_event_stat.count order by int_event_stat.count desc, event_name;