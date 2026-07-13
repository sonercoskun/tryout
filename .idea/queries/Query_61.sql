create table UMCSYS.PTML_CHN_SMS_BBC
(
    ID             unknown,
    MSISDN         unknown,
    SMS_TYPE       unknown,
    CAMPAIGN_CODE  unknown,
    TREATMENT_CODE unknown,
    OPTIN_CODE     unknown,
    SMS_TEXT       unknown,
    NO_OF_RETRIES  unknown,
    DISPLAY        unknown,
    VP             unknown,
    STATUS_LOG     unknown,
    TITLE          unknown,
    NOTIFY_MOBILE  unknown,
    SEND_FROM_NO   unknown,
    REC_SMS_TEXT   unknown,
    LAST_CHANGE    unknown,
    SMS_STATUS     unknown,
    STATUS_DESC    unknown,
    OPTOUT_CODE    unknown,
    LD_CODE        unknown,
    PROV_VALUE     unknown,
    PROV_COMMENTS  unknown,
    PROV_REASON_ID unknown,
    VAR_DATA_1     unknown,
    VAR_DATA_2     unknown,
    VAR_DATA_3     unknown,
    PROV_EXPIRY    unknown,
    START_HOUR     unknown,
    END_HOUR       unknown,
    DAY_KEY        unknown,
    constraint PK_PTML_CHN_SMS_BBC
        primary key ()
)
/

create index UMCSYS.MSISDN_PTML_CHN_SMS_BBC_IDX
    on UMCSYS.PTML_CHN_SMS_BBC ()
/

create index UMCSYS.PK_PTML_CHN_SMS_BBC
    on UMCSYS.PTML_CHN_SMS_BBC ()
/

create index UMCSYS.PTMLSMSBBC_SMSSTATUS_LDCODE_ID
    on UMCSYS.PTML_CHN_SMS_BBC ()
/

create index UMCSYS.PTML_CHN_SMS_BBC_IDX01
    on UMCSYS.PTML_CHN_SMS_BBC ()
/

create index UMCSYS.PTML_CHN_SMS_BBC_IDX02
    on UMCSYS.PTML_CHN_SMS_BBC ()
/

create index UMCSYS.PTML_CHN_SMS_BBC_IDX03
    on UMCSYS.PTML_CHN_SMS_BBC ()
/

create index UMCSYS.PTML_CHN_SMS_BBC_IDX04
    on UMCSYS.PTML_CHN_SMS_BBC ()
/

create index UMCSYS.PTML_CHN_SMS_BBC_SMS_ST_IDX
    on UMCSYS.PTML_CHN_SMS_BBC ()
/

