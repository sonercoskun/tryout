SELECT CACHE_TIME, NAME, CACHE_SIZE
FROM (
         SELECT
             NAME,
             CACHE_SIZE,
             TO_TIMESTAMP(0) + (CREATED_DATE / 1000) * INTERVAL '1 second' AS CACHE_TIME,
             RANK() OVER (PARTITION BY NAME ORDER BY ID DESC) AS RN
         FROM EEC_CACHE_METRIC
                  JOIN EEC_CACHE_CONFIGURATION ON EEC_CACHE_METRIC.NAME = EEC_CACHE_CONFIGURATION.CACHE_NAME
     ) AS sq
WHERE RN = 1;
SELECT CACHE_TIME, NAME, CACHE_SIZE, cron, loadSQL
FROM (
         SELECT
             NAME,
             CACHE_SIZE,
             TO_TIMESTAMP(0) + (CREATED_DATE / 1000) * INTERVAL '1 second' AS CACHE_TIME,
             (convert_from(lo_get(cast(caching_configuration AS bigint)), 'UTF8')::jsonb -> 'bulkLoad' ->> 'cron') AS cron,
             (convert_from(lo_get(cast(caching_configuration AS bigint)), 'UTF8')::jsonb -> 'bulkLoad' ->> 'loadSQL') AS loadSQL,
             RANK() OVER (PARTITION BY NAME ORDER BY ID DESC) AS RN
         FROM EEC_CACHE_METRIC
                  JOIN EEC_CACHE_CONFIGURATION ON EEC_CACHE_METRIC.NAME = EEC_CACHE_CONFIGURATION.CACHE_NAME
     ) AS sq
WHERE RN = 1 order by cache_size desc;