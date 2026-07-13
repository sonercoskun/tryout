create table ENG.CAMPAIGN_OFFERS
(
    SUBSEGMENT_NAME      VARCHAR2(255),
    MSISDN               VARCHAR2(20),
    OFFER_NAME           VARCHAR2(255),
    OFFER_START_DATE     TIMESTAMP(6),
    OFFER_END_DATE       TIMESTAMP(6),
    OFFER_GROUP          VARCHAR2(50),
    TRANSACTION_ID       VARCHAR2(255),
    STATUS               NUMBER,
    CAMPAIGN_OFFER_LIMIT NUMBER,
    SCENARIO             VARCHAR2(255),
    INSERT_DATE          TIMESTAMP(6) default SYSDATE,
    NBO_OFFER_PRIORITY   NUMBER,
    ID                   NUMBER       default "ENG"."ISEQ$$_73054".nextval generated as identity (minvalue 1000000)
		constraint CAMPAIGN_OFFERS_PK
			primary key
);