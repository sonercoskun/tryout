create or replace TYPE t_priority_offer_row AS OBJECT (
                                                          CAMP_LIMIT_RN             NUMBER,
                                                          OFFER_RN                  NUMBER,
                                                          CAMPAIGN_EXECUTION_ORDER  NUMBER,
                                                          OFFER_OBJECT_SEQUENCE     NUMBER,
                                                          OFFER_POSITION            NUMBER,
                                                          OFFER_LIMIT               NUMBER,
                                                          SCENARIO                  VARCHAR2(255),
                                                          OFFER_NAME                VARCHAR2(255),
                                                          SUBSEGMENT_NAME           VARCHAR2(255),
                                                          SEGMENT_NAME              VARCHAR2(255),
                                                          MSISDN                    VARCHAR2(50),
                                                          OFFER_START_DATE          DATE,
                                                          OFFER_END_DATE            DATE,
                                                          OFFER_GROUP               VARCHAR2(100),

    -- DÜZELTME: NUMBER -> VARCHAR2(255)
                                                          TRANSACTION_ID            VARCHAR2(255),

                                                          STATUS                    NUMBER,
                                                          INSERT_DATE               DATE,
                                                          ID                        NUMBER,
                                                          NBO_OFFER_PRIORITY        NUMBER,
                                                          INVISIBLE_DATE            DATE
                                                      );
create or replace TYPE t_priority_offer_table AS TABLE OF t_priority_offer_row;