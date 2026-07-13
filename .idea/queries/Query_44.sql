WITH cte AS (
    SELECT
        MSISDN AS ACTOR_ID,
        OCS_PRODUCT_ID,
        ROW_NUMBER() OVER (PARTITION BY MSISDN ORDER BY last_change DESC) AS rn
    FROM MP_BVEW_UNI.PTML_CHN_PROV_IMDTE
    WHERE last_change >= CURRENT_DATE - INTERVAL '30' DAY
)
SELECT
    ACTOR_ID,
    TRIM(TRAILING '-' FROM (
        COALESCE(MAX(CASE WHEN rn = 1 THEN CAST(OCS_PRODUCT_ID AS VARCHAR(20)) END), '') || '-' ||
        COALESCE(MAX(CASE WHEN rn = 2 THEN CAST(OCS_PRODUCT_ID AS VARCHAR(20)) END), '') || '-' ||
        COALESCE(MAX(CASE WHEN rn = 3 THEN CAST(OCS_PRODUCT_ID AS VARCHAR(20)) END), '') || '-' ||
        COALESCE(MAX(CASE WHEN rn = 4 THEN CAST(OCS_PRODUCT_ID AS VARCHAR(20)) END), '') || '-' ||
        COALESCE(MAX(CASE WHEN rn = 5 THEN CAST(OCS_PRODUCT_ID AS VARCHAR(20)) END), '') || '-' ||
        COALESCE(MAX(CASE WHEN rn = 6 THEN CAST(OCS_PRODUCT_ID AS VARCHAR(20)) END), '') || '-' ||
        COALESCE(MAX(CASE WHEN rn = 7 THEN CAST(OCS_PRODUCT_ID AS VARCHAR(20)) END), '') || '-' ||
        COALESCE(MAX(CASE WHEN rn = 8 THEN CAST(OCS_PRODUCT_ID AS VARCHAR(20)) END), '') || '-' ||
        COALESCE(MAX(CASE WHEN rn = 9 THEN CAST(OCS_PRODUCT_ID AS VARCHAR(20)) END), '') || '-' ||
        COALESCE(MAX(CASE WHEN rn = 10 THEN CAST(OCS_PRODUCT_ID AS VARCHAR(20)) END), '')
        )) AS OCS_PRODUCT_IDS
FROM cte
GROUP BY ACTOR_ID;


select * from test_apriori_table;

SELECT table_name
FROM information_schema.tables
WHERE table_schema='evam'
  AND table_type='BASE TABLE' and table_name like '%_table';

select scenario_name, status from int_scenario_def where scenario_name='eec_test';
select * from int_action where scenario_name ='eec_test';
select * from eec_test_table;
--drop table eec_test_table;

SELECT count(*) as active_connections
FROM pg_stat_activity;

select count(*), client_addr, state from pg_stat_activity group by client_addr, state;

select  count(1)  from int_segment_run isr  WHERE TO_CHAR
                                                  (start_date, 'MM-DD-YYYY') = '12-19-2024'
                                              and status ='RUNNING';


SELECT pid, usename, datname, state, query, query_start
FROM pg_stat_activity
WHERE state = 'active'
ORDER BY query_start DESC;

SELECT pid, usename, datname, state, query, now() - query_start AS duration
FROM pg_stat_activity
WHERE state = 'active'
  --AND now() - query_start > interval '1000 seconds'
ORDER BY duration DESC;

SELECT pg_terminate_backend(669213);

SELECT max(oid) FROM pg_largeobject_metadata;
SHOW next_oid;
SELECT COUNT(*) FROM pg_largeobject_metadata;

select * from pg_largeobject_metadata where OID=252379533;   --4289798303   4 289 698 303  / 4 289 708 699  /
-- 4 289 735 704 / 4 289 738 089 / 4 289 735 340 / 4 289 729 678  /  4 289 385 707 / 4 288 887 644
--4 283 890 893
select * from pg_largeobject where loid=252379533;   --4289798303   4289698303
SELECT * from pg_largeobject_metadata;
SELECT count(loid) from pg_largeobject where data = '[]';
select * from orphantablo;
select lo_get(12002);
select lo_unlink(252379533);

select * from pg_authid where oid = 16389;

select * from pg_depend;


SELECT
    table_schema || '.' || table_name AS table_full_name,
    pg_size_pretty(pg_total_relation_size(table_schema || '.' || table_name)) AS total_size,
    pg_size_pretty(pg_table_size(table_schema || '.' || table_name)) AS table_size,
    pg_size_pretty(pg_indexes_size(table_schema || '.' || table_name)) AS index_size
FROM
    information_schema.tables
WHERE
    table_schema NOT IN ('pg_catalog', 'information_schema') -- Exclude system schemas
  AND table_type = 'BASE TABLE'
ORDER BY
    pg_total_relation_size(table_schema || '.' || table_name) DESC;

