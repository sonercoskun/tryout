create table ENG.INT_FUTURE_EVENT
(
    SCENARIO_NAME VARCHAR2(80)  not null,
    ACTORID       VARCHAR2(80)  not null,
    EVENT_NAME    VARCHAR2(200) not null,
    EVENT_PARAMS  VARCHAR2(4000),
    INSERT_DATE   TIMESTAMP(6),
    DUE_DATE      TIMESTAMP(6),
    constraint INT_FUTURE_EVENT_PK
        primary key (SCENARIO_NAME, ACTORID, EVENT_NAME)
)
/

comment on table ENG.INT_FUTURE_EVENT is 'Contains details about future events that are going to be triggered'
/

comment on column ENG.INT_FUTURE_EVENT.SCENARIO_NAME is 'Contains scenario name which the future event will be processed in'
/

comment on column ENG.INT_FUTURE_EVENT.ACTORID is 'Contains actorId for whom the future event is created'
/

comment on column ENG.INT_FUTURE_EVENT.EVENT_NAME is 'Contains event name for the created future event'
/

comment on column ENG.INT_FUTURE_EVENT.EVENT_PARAMS is 'Contains event parameters which the future event is created with'
/

comment on column ENG.INT_FUTURE_EVENT.INSERT_DATE is 'Contains date when the future event is created in the system'
/

comment on column ENG.INT_FUTURE_EVENT.DUE_DATE is 'Contains date when the future event will be processed in the system'
/

create index ENG.SCENARIO_NAME_IDX
    on ENG.INT_FUTURE_EVENT (SCENARIO_NAME)
/

create index ENG.DUE_DATE_SELECT_IDX
    on ENG.INT_FUTURE_EVENT (DUE_DATE)
/

