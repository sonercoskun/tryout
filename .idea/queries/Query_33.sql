select * from int_custom_offer_status where offer_uuid in('27ca7e48-3847-11ef-a133-0050569620aa','96a44fc0-3859-11ef-a133-0050569620aa','78c6bb37-384a-11ef-a133-0050569620aa','876f3a6e-3874-11ef-a133-0050569620aa');
delete from int_custom_offer_status where offer_uuid  in('27ca7e48-3847-11ef-a133-0050569620aa','96a44fc0-3859-11ef-a133-0050569620aa','78c6bb37-384a-11ef-a133-0050569620aa','876f3a6e-3874-11ef-a133-0050569620aa');
select * from int_custom_offer_status where scenario_name='C000008065';
commit;
select * from segment_schedule;