WITH
    -- CTE 1: Segmentlere özel teklif sıralamasını (offer_position) ayrıştırır.
    segment_offer_priority AS (
        SELECT
            s.segment_name,
            REGEXP_SUBSTR(s.offers, '[^,]+', 1, LEVEL) AS offer_name,
            LEVEL AS offer_position -- Segment içindeki teklif pozisyonu
        FROM int_segment_offer_mapping s
        CONNECT BY REGEXP_SUBSTR(s.offers, '[^,]+', 1, LEVEL) IS NOT NULL
               AND PRIOR s.rowid = s.rowid
               AND PRIOR dbms_random.value IS NOT NULL
    ),

    -- CTE 2: Müşteri için geçerli, yinelenmeyen kampanyaları bulur ve sıralama için gerekli alanları içerir.
    ranked_customer_offers AS (
        SELECT
            co.OFFER_NAME,
            sd.PRECEDENCE,
            co.SCENARIO,
            co.CAMPAIGN_OFFER_LIMIT,
            co.OFFER_GROUP,
            co.TRANSACTION_ID,
            co.SUBSEGMENT_NAME,
            co.ID,
            iss.SEGMENT_ORDER, -- Sıralama için bu alanı da ana sorguya taşımalıyız.
            ROW_NUMBER() OVER (
                PARTITION BY co.offer_name
                ORDER BY sd.precedence DESC NULLS LAST, iss.SEGMENT_ORDER ASC NULLS LAST
                ) AS rn
        FROM CAMPAIGN_OFFERS co
                 LEFT JOIN int_scenario_def sd ON sd.SCENARIO_NAME = co.SCENARIO
                 LEFT JOIN int_scenario_segment iss ON iss.SCENARIO_NAME = co.SCENARIO AND iss.name = co.subsegment_name
        WHERE
            co.MSISDN = '96569395099'
          AND SYSDATE BETWEEN co.OFFER_START_DATE AND co.OFFER_END_DATE
          AND co.STATUS = 0
    )
-- Ana Sorgu: Müşterinin tekliflerini birleştirir ve istenen yeni sıraya göre sıralar.
SELECT
    rco.OFFER_NAME AS "offerName",
    rco.PRECEDENCE AS "precedence",
    rco.SCENARIO AS "campaignName",
    rco.CAMPAIGN_OFFER_LIMIT AS "campaignOfferLimit",
    rco.OFFER_GROUP AS "offerGroup",
    rco.TRANSACTION_ID AS "transactionId",
    rco.SUBSEGMENT_NAME AS "subsegmentName",
    rco.ID AS "id"
FROM ranked_customer_offers rco
         LEFT JOIN segment_offer_priority sop
                   ON rco.SUBSEGMENT_NAME = sop.segment_name AND rco.OFFER_NAME = sop.offer_name
WHERE rco.rn = 1 -- Sadece en yüksek öncelikli (yinelenmeyen) teklifleri al
ORDER BY
    -- 1. Öncelik: Genel kampanya önceliği (en yüksek olan en üstte).
    rco.PRECEDENCE DESC NULLS LAST,
    -- 2. Öncelik: Senaryo içindeki segment sırası (düşük olan daha öncelikli).
    rco.SEGMENT_ORDER ASC NULLS LAST,
    -- 3. Öncelik: Segment haritasındaki özel teklif sırası (düşük olan daha öncelikli).
    sop.offer_position ASC NULLS LAST;


SELECT
    JSON_VALUE(PARAMETERS, '$.COMMISSION_PRICE') AS commission_price
FROM
    INT_CUSTOM_BENEFIT_OBJECT_DEF d;