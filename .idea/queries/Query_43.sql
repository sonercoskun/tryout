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

select scenario_name from int_scenario_def;

drop table broadcast_test_table;