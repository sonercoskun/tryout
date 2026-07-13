create table ENG.INT_SCEN_COMMUNICATION_HIST
(
    ID            NUMBER(19) not null
        primary key,
    CODE          VARCHAR2(255 char),
    CONTENT       CLOB,
    DESCRIPTION   VARCHAR2(255 char),
    NAME          VARCHAR2(255 char),
    SCEN_HIST_ID  NUMBER(19),
    SCENARIO_NAME VARCHAR2(255 char),
    TYPE          VARCHAR2(255 char)
)
/

