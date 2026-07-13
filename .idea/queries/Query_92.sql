select * from hopi_model_staging.v_fact_user_balance_latest;

WITH balance AS (
    SELECT DISTINCT
        bird_id,
        balance,
        CAST(FLOOR(balance) AS INT64) AS balance_integer,
        50 AS ustlimit,
        30 AS altlimit,
        CAST(balance_change_date AS DATE) AS balance_change_date,
        LAST_DAY(DATE_ADD(CAST(balance_change_date AS DATE), INTERVAL 1 YEAR)) AS expiry_date
    FROM `hopi_model_staging.v_fact_user_balance_latest`
    WHERE special_coin_type_id = -1)
SELECT DISTINCT
    bird_id as actor_id,
    balance_integer AS np_miktar,balance_change_date,
    (balance.ustlimit - balance.balance_integer) AS eklenecek_miktar,
    GREATEST(
            DATE_DIFF(expiry_date, CURRENT_DATE(), DAY),0) AS kalan_gun
FROM balance;

SELECT bird_id AS actor_id, 1 AS Flag
FROM hopi-big-data.bq_b2b.AD_TROY_POPUP_20250522;