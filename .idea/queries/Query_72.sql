create table ENG.INT_CUSTOM_BENEFIT_DEF
(
    ID           NUMBER(19)         not null
        primary key,
    NAME         VARCHAR2(200 char) not null
        constraint INT_CUSTOM_BENEFIT_DEF_UQ
            unique,
    DESCRIPTION  VARCHAR2(4000 char),
    PARAMETERS   CLOB,
    CREATED_BY   VARCHAR2(255 char),
    CREATED_DATE TIMESTAMP(6)       not null,
    UPDATED_BY   VARCHAR2(255 char),
    UPDATED_DATE TIMESTAMP(6)
)
/

