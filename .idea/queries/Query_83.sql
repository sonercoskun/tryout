--------------------------------------------------------
--  DDL for Function GET_FINAL_SUPPRESSED_OFFERS
--------------------------------------------------------

CREATE OR REPLACE EDITIONABLE FUNCTION "ENG"."GET_FINAL_SUPPRESSED_OFFERS" (
    p_msisdn IN VARCHAR2
)
    RETURN t_priority_offer_table PIPELINED
AS
BEGIN
    FOR rec IN (
        SELECT
            r.CAMP_LIMIT_RN, r.OFFER_RN,
            r.CAMPAIGN_EXECUTION_ORDER, r.OFFER_OBJECT_SEQUENCE, r.OFFER_POSITION, r.OFFER_LIMIT, r.SCENARIO, r.OFFER_NAME, r.SUBSEGMENT_NAME, r.SEGMENT_NAME, r.MSISDN, r.OFFER_START_DATE, r.OFFER_END_DATE, r.OFFER_GROUP, r.TRANSACTION_ID, r.STATUS, r.INSERT_DATE, r.ID, r.NBO_OFFER_PRIORITY, r.INVISIBLE_DATE
        FROM (
                 SELECT
                     final_ranked_offers.*,
                     MAX(CASE WHEN final_ranked_offers.OFFER_GROUP = 'Anonymus' THEN 1 ELSE 0 END) OVER (PARTITION BY final_ranked_offers.MSISDN)   AS IN_ANONYMOUS,
                     MAX(CASE WHEN final_ranked_offers.OFFER_GROUP = 'Autorenewal' THEN 1 ELSE 0 END) OVER (PARTITION BY final_ranked_offers.MSISDN) AS IN_AUTORENEWAL,
                     MAX(CASE WHEN final_ranked_offers.OFFER_GROUP = 'Exclusive_Offer' THEN 1 ELSE 0 END) OVER (PARTITION BY final_ranked_offers.MSISDN)   AS IN_EXCLUSIVE,
                     MAX(CASE WHEN final_ranked_offers.OFFER_GROUP = 'NBO' THEN 1 ELSE 0 END) OVER (PARTITION BY final_ranked_offers.MSISDN)         AS IN_NBO,
                     MAX(CASE WHEN final_ranked_offers.OFFER_GROUP = 'Standart' THEN 1 ELSE 0 END) OVER (PARTITION BY final_ranked_offers.MSISDN)    AS IN_STANDARD
                 FROM (
                          select CAMP_LIMIT_RN, OFFER_RN,
                                 CAMPAIGN_EXECUTION_ORDER, OFFER_OBJECT_SEQUENCE, OFFER_POSITION, OFFER_LIMIT, SCENARIO, OFFER_NAME, SUBSEGMENT_NAME, SEGMENT_NAME, MSISDN, OFFER_START_DATE, OFFER_END_DATE, OFFER_GROUP, TRANSACTION_ID, STATUS, INSERT_DATE, ID, NBO_OFFER_PRIORITY, INVISIBLE_DATE
                          from (
                                   select
                                       rank() OVER (PARTITION BY SCENARIO ORDER BY OFFER_RN asc) CAMP_LIMIT_RN,
                                       OFFER_RN, CAMPAIGN_EXECUTION_ORDER, OFFER_OBJECT_SEQUENCE, OFFER_POSITION, OFFER_LIMIT, SCENARIO, OFFER_NAME, SUBSEGMENT_NAME, SEGMENT_NAME, MSISDN, OFFER_START_DATE, OFFER_END_DATE, OFFER_GROUP, TRANSACTION_ID, STATUS, INSERT_DATE, ID, NBO_OFFER_PRIORITY, INVISIBLE_DATE
                                   from
                                       (
                                           select
                                               rank() OVER (PARTITION BY UNIQUE_OFFER_RN ORDER BY CAMPAIGN_EXECUTION_ORDER desc, OFFER_OBJECT_SEQUENCE desc, OFFER_POSITION asc) OFFER_RN,
                                               CAMPAIGN_EXECUTION_ORDER, OFFER_OBJECT_SEQUENCE, OFFER_POSITION, OFFER_LIMIT, SCENARIO, OFFER_NAME, SUBSEGMENT_NAME, SEGMENT_NAME, MSISDN, OFFER_START_DATE, OFFER_END_DATE, OFFER_GROUP, TRANSACTION_ID, STATUS, INSERT_DATE, ID, NBO_OFFER_PRIORITY, INVISIBLE_DATE
                                           from (
                                                    SELECT
                                                        rank() OVER (PARTITION BY campaign_offers.OFFER_NAME ORDER BY campaign_offers.ID asc) UNIQUE_OFFER_RN,
                                                        nvl(ınt_scenarıo_def.PRECEDENCE,0) as campaıgn_Executıon_Order, nvl(INT_CUSTOM_BENEFIT_OBJECT_DEF.sequence,0) as offer_object_sequence,
                                                        int_segment_offer_mapping.offer_position,

                                                        TO_NUMBER(nvl(INT_SCENARIO_META_PARAMETER.OFFER_LIMIT, 999) DEFAULT 999 ON CONVERSION ERROR) as OFFER_LIMIT,

                                                        campaign_offers.scenario, campaign_offers.offer_name, campaign_offers.subsegment_name, int_segment_offer_mapping.segment_name,
                                                        campaign_offers.msisdn, campaign_offers.offer_start_date, campaign_offers.offer_end_date, campaign_offers.offer_group,

                                                        campaign_offers.transaction_id,
                                                        campaign_offers.status,
                                                        campaign_offers.insert_date,
                                                        campaign_offers.id,
                                                        campaign_offers.nbo_offer_priority,

                                                        campaign_offers.invisible_date
                                                    FROM
                                                        campaign_offers, ınt_scenarıo_def,
                                                        (SELECT d.NAME, jt.param_name, jt.param_value AS sequence FROM INT_CUSTOM_BENEFIT_OBJECT_DEF d, JSON_TABLE(d.parameters, '$[*]'
                                                                                                                                                                   COLUMNS ( param_name  VARCHAR2(100) PATH '$.parameterName', param_value NUMBER        PATH '$.value' ) ) jt
                                                         where jt.param_name='SEQUENCE') INT_CUSTOM_BENEFIT_OBJECT_DEF,
                                                        (SELECT s.segment_name, REGEXP_SUBSTR(s.offers, '[^,]+', 1, LEVEL) AS offer_name, LEVEL AS offer_position FROM int_segment_offer_mapping s
                                                         CONNECT BY REGEXP_SUBSTR(s.offers, '[^,]+', 1, LEVEL) IS NOT NULL AND PRIOR s.rowid = s.rowid AND PRIOR dbms_random.value IS NOT NULL) int_segment_offer_mapping,

                                                        (SELECT SCENARIO_NAME, JSON_VALUE(PARAMETER_VALUES, '$.OFFER_LIMIT') AS OFFER_LIMIT FROM INT_SCENARIO_META_PARAMETER) INT_SCENARIO_META_PARAMETER

                                                    where 1=1

                                                      and campaign_offers.msısdn = p_msisdn

                                                      AND campaign_offers.STATUS = 0

                                                      AND SYSDATE BETWEEN campaign_offers.OFFER_START_DATE AND campaign_offers.OFFER_END_DATE
                                                      and ınt_scenarıo_def.scenarıo_name(+)=campaign_offers.scenario --AND INT_SCENARIO_DEF.STATUS='DEPLOYED'
                                                      and INT_CUSTOM_BENEFIT_OBJECT_DEF.NAME(+)=campaign_offers.offer_name
                                                      and int_segment_offer_mapping.offer_name(+)=campaign_offers.offer_name
                                                      and int_segment_offer_mapping.segment_name(+)=campaign_offers.subsegment_name
                                                      and int_scenario_meta_parameter.scenario_name(+)=ınt_scenarıo_def.scenarıo_name
                                                ) where UNIQUE_OFFER_RN=1
                                       )
                               ) where CAMP_LIMIT_RN<=OFFER_LIMIT order by OFFER_RN asc
                      ) final_ranked_offers
             ) r
                 JOIN INBOUND_SUPPRESSION_MATRIX m
                      ON r.IN_ANONYMOUS   = m.IN_ANONYMOUS
                          AND r.IN_AUTORENEWAL = m.IN_AUTORENEWAL
                          AND r.IN_EXCLUSIVE   = m.IN_EXCLUSIVE
                          AND r.IN_NBO         = m.IN_NBO
                          AND r.IN_STANDARD    = m.IN_STANDARD
        WHERE
            (
                (r.OFFER_GROUP = 'Anonymus'   AND m.OUT_ANONYMOUS = 1) OR
                (r.OFFER_GROUP = 'Autorenewal' AND m.OUT_AUTORENEWAL = 1) OR
                (r.OFFER_GROUP = 'Exclusive_Offer'   AND m.OUT_EXCLUSIVE = 1) OR
                (r.OFFER_GROUP = 'NBO'         AND m.OUT_NBO = 1) OR
                (r.OFFER_GROUP = 'Standart'    AND m.OUT_STANDARD = 1)
                ) order by r.OFFER_RN
        )
        LOOP
            PIPE ROW (
                t_priority_offer_row(
                        rec.CAMP_LIMIT_RN,
                        rec.OFFER_RN,
                        rec.CAMPAIGN_EXECUTION_ORDER,
                        rec.OFFER_OBJECT_SEQUENCE,
                        rec.OFFER_POSITION,
                        rec.OFFER_LIMIT,
                        rec.SCENARIO,
                        rec.OFFER_NAME,
                        rec.SUBSEGMENT_NAME,
                        rec.SEGMENT_NAME,
                        rec.MSISDN,
                        rec.OFFER_START_DATE,
                        rec.OFFER_END_DATE,
                        rec.OFFER_GROUP,
                        rec.TRANSACTION_ID,
                        rec.STATUS,
                        rec.INSERT_DATE,
                        rec.ID,
                        rec.NBO_OFFER_PRIORITY,
                        rec.INVISIBLE_DATE
                )
                );
        END LOOP;

    RETURN;
END get_final_suppressed_offers;