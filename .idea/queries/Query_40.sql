SELECT count(*) as active_connections FROM pg_stat_activity;

select count(*), client_addr, state from pg_stat_activity group by client_addr, state;

select * from int_segment_ds_mapping as isdm where isdm.id in (
select id from int_segment as seg where seg.name in (select segment_name  from int_segment_run isr  WHERE TO_CHAR
                                                  (start_date, 'MM-DD-YYYY') = '11-01-2024'
                                              and status ='RUNNING'));

5340754691
3331032
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

SELECT
    pid,                                 -- Process ID of the backend
    usename,                             -- User who executed the query
    datname,                             -- Database name
    state,                               -- State of the connection (active, idle, etc.)
    query_start,                         -- Time at which the query started
    now() - query_start AS exec_duration, -- Duration for which the query has been running
    query                                -- The SQL query text
FROM
    pg_stat_activity
WHERE
    state = 'active'                     -- Filter to show only active queries
  AND pid <> pg_backend_pid()          -- Exclude the current session
ORDER BY
    query_start DESC;

select convert_from(lo_get(cast("json_value" as bigint)),'UTF8') as cont, *  from int_segment isc where isc.code='SGMNT_4E2FI';

select * from int_segment_ds_mapping as isdm where isdm.id in
                                                   (SELECT
    id
FROM
    (select * from int_segment as seg where seg.name in (select segment_name  from int_segment_run isr  WHERE TO_CHAR
                                                                                                                  (start_date, 'MM-DD-YYYY') = '10-31-2024'
                                                                                                              and status ='RUNNING')),
    LATERAL regexp_split_to_table(convert_from(lo_get(cast("json_value" as bigint)),'UTF8'), 'mappingId') AS occurrences);


--Running Segment Layer Connection Count for Each Connection--
 select pcn,SUM(cnt) AS total_count from (SELECT
     count(res.id) as cnt,isdm.physical_connection_name as pcn FROM
     (select * from int_segment as seg where seg.name in (select segment_name  from int_segment_run isr  WHERE TO_CHAR
                                                                                                               (start_date, 'MM-DD-YYYY') = '11-01-2024'
                                                                                                           and status ='RUNNING')) as res
         left join int_segment_ds_mapping isdm on isdm.id = res.id,
     LATERAL regexp_split_to_table(convert_from(lo_get(cast("json_value" as bigint)),'UTF8'), 'mappingId') AS occurrences group by res.id,isdm.physical_connection_name) group by pcn;

select * from int_segment where id = 1745;


select convert_from(lo_get(cast("sql" as bigint)),'UTF8') as cont, *
from int_segment_ds_mapping isc where isc.id in
(select id from int_segment where name in ('REMINDER_C000005640'
    ,'REMINDER_C000005640'
    ,'NRG_CG_C000008583'
    ,'Reminder_SOCIAL_HERO_C000008264'
    ,'DH_COMM_C000007928'
    ,'Reminder_WEEKLY_FB_C000008264'
    ,'RE_PROV_999_C000005593'
    ,'TG_SLO_ELGBL_C000007854'
    ,'DOR_IN_SUBS_999_C000005593'
    ,'IC_ONLY_C000007854_CG'
    ,'DAY3_DORMANT_C000007854_CG'
    ,'SMSCurrMonTOS_P000006'
    ,'NRG_REMAINING_NDH_C000007872_TG','Communication_C000008245','COMM_NRG_7DAY_DORMANT_NON_SLO_C000007860_CG','COMM_C000008746','COMM_OTHERS_C000007860_TG'));

select msisdn as ACTOR_ID, CAMPAIGN_CODE, FLOW_CHART from ADHOC_SMS_NUMBERS;
SELECT CUSTOMERID,CUSTOMERID AS ACTOR_ID FROM Puiuptrsys.Prepaid_Data_Segmentation;
SELECT
    MSISDN,
    MSISDN AS actor_id
FROM
    MP_BVEW_CMT.CVM_PROFILE_WEEKLY
WHERE
    RPRTNG_DT = current_date()-1
  and  ENGAGEMENT_TYPE = 'SUPER ENGAGED';

SELECT MSISDN,MSISDN AS ACTOR_ID
FROM MP_BVEW_CMT.SBSCP_RECHRG_HRLY_FCT
WHERE Recharge_DT = DATE-1
  AND RECHRG_DESC <> ' Loan Avail'
  AND RECHRG_TYPE_KEY IN ( 1,2 )
HAVING SUM(RECHARGE_AMOUNT) >= 100
    GROUP BY 1;