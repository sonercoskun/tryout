create sequence EEC_APPLICATION_SEQ;

create sequence EEC_CACHE_METRICS_SEQ;

create sequence EEC_DATA_SOURCE_CONN_SEQ;

create sequence EEC_EVENT_SEQ;

create sequence EEC_NODE_METRICS_SEQ;

create sequence EEC_OPERATION_LOG_SEQ;

create sequence EEC_PROFILE_SEQUENCE;

create sequence EEC_ULA_SEQ;

create sequence EEC_USER_SEQUENCE;

create sequence EEC_USER_TOKEN_ID_SEQ;

create table EEC_CACHE_CONFIGURATION
(
    CACHE_NAME VARCHAR2(255 char) not null
        primary key,
    CACHING_CONFIGURATION CLOB,
    CREATE_DATE TIMESTAMP(6),
    CREATE_OPERATION_OWNER VARCHAR2(255 char),
    CREATE_OPERATION_OWNER_TYPE VARCHAR2(255 char),
    DESCRIPTION VARCHAR2(255 char),
    IS_COMPOSITE VARCHAR2(255 char),
    UPDATE_DATE TIMESTAMP(6),
    UPDATE_OPERATION_OWNER VARCHAR2(255 char),
    UPDATE_OPERATION_OWNER_TYPE VARCHAR2(255 char)
);

create table EEC_CACHE_METRIC
(
    ID                                   NUMBER(19) not null
        primary key,
    AVERAGE_GET_TIME                     FLOAT      not null,
    AVERAGE_PUT_TIME                     FLOAT      not null,
    AVERAGE_REMOVE_TIME                  FLOAT      not null,
    AVERAGE_TX_COMMIT_TIME               FLOAT      not null,
    AVERAGE_TX_ROLLBACK_TIME             FLOAT      not null,
    CACHE_EVICTIONS                      NUMBER(19) not null,
    CACHE_GETS                           NUMBER(19) not null,
    CACHE_HIT_PERCENTAGE                 FLOAT      not null,
    CACHE_HITS                           NUMBER(19) not null,
    CACHE_MISS_PERCENTAGE                FLOAT      not null,
    CACHE_MISSES                         NUMBER(19) not null,
    CACHE_PUTS                           NUMBER(19) not null,
    CACHE_REMOVALS                       NUMBER(19) not null,
    CACHE_TX_COMMITS                     NUMBER(19) not null,
    CACHE_TX_ROLLBACKS                   NUMBER(19) not null,
    CREATED_DATE                         NUMBER(19),
    DHT_EVICT_QUEUE_CURRENT_SIZE         NUMBER(10) not null,
    EMPTY                                NUMBER(1)  not null,
    KEY_SIZE                             NUMBER(10) not null,
    KEY_TYPE                             VARCHAR2(255 char),
    MANAGEMENT_ENABLED                   NUMBER(1)  not null,
    NAME                                 VARCHAR2(255 char),
    NODE_ID                              VARCHAR2(255 char),
    OFF_HEAP_ALLOCATED_SIZE              NUMBER(19) not null,
    OFF_HEAP_ENTRIES_COUNT               NUMBER(19) not null,
    OFF_HEAP_EVICTIONS                   NUMBER(19) not null,
    OFF_HEAP_GETS                        NUMBER(19) not null,
    OFF_HEAP_HIT_PERCENTAGE              FLOAT      not null,
    OFF_HEAP_HITS                        NUMBER(19) not null,
    OFF_HEAP_MAX_SIZE                    NUMBER(19) not null,
    OFF_HEAP_MISS_PERCENTAGE             FLOAT      not null,
    OFF_HEAP_MISSES                      NUMBER(19) not null,
    OFF_HEAP_PUTS                        NUMBER(19) not null,
    OFF_HEAP_REMOVALS                    NUMBER(19) not null,
    OVERFLOW_SIZE                        NUMBER(19) not null,
    READ_THROUGH                         NUMBER(1)  not null,
    CACHE_SIZE                           NUMBER(19),
    STORE_BY_VALUE                       NUMBER(1)  not null,
    SWAP_ENTRIES_COUNT                   NUMBER(19) not null,
    SWAP_GETS                            NUMBER(19) not null,
    SWAP_HIT_PERCENTAGE                  FLOAT      not null,
    SWAP_HITS                            NUMBER(19) not null,
    SWAP_MISS_PERCENTAGE                 FLOAT      not null,
    SWAP_MISSES                          NUMBER(19) not null,
    SWAP_PUTS                            NUMBER(19) not null,
    SWAP_REMOVALS                        NUMBER(19) not null,
    SWAP_SIZE                            NUMBER(19) not null,
    TX_COMMIT_QUEUE_SIZE                 NUMBER(10) not null,
    TX_COMMITTED_VERSIONS_SIZE           NUMBER(10) not null,
    TX_DHT_COMMIT_QUEUE_SIZE             NUMBER(10) not null,
    TX_DHT_PREPARE_QUEUE_SIZE            NUMBER(10) not null,
    TX_PREPARE_QUEUE_SIZE                NUMBER(10) not null,
    TX_ROLLEDBACK_VERSIONS_SIZE          NUMBER(10) not null,
    TX_START_VERSION_COUNTS_SIZE         NUMBER(10) not null,
    TX_THREAD_MAP_SIZE                   NUMBER(10) not null,
    TX_XID_MAP_SIZE                      NUMBER(10) not null,
    VALUE_TYPE                           VARCHAR2(255 char),
    WRITE_BEHIND_BUFFER_SIZE             NUMBER(10) not null,
    WRITE_BEHIND_ENABLED                 NUMBER(1)  not null,
    WRITE_BEHIND_FLUSH_FREQUENCY         NUMBER(19) not null,
    WRITE_BEHIND_FLUSH_SIZE              NUMBER(10) not null,
    WRITE_THROUGH                        NUMBER(1)  not null
);

create table EEC_CUSTOM_DRIVERS
(
    DRIVER_NAME VARCHAR2(255 char) not null
        primary key,
    TEST_SQL VARCHAR2(255 char),
    URL_TEMPLATE VARCHAR2(255 char)
);

create table EEC_DATA_SOURCE_CONNECTION
(
    ID NUMBER(10) not null
        primary key,
    DB_DRIVER VARCHAR2(255 char),
    DB_PASS VARCHAR2(255 char),
    DB_URL VARCHAR2(255 char),
    DB_USER VARCHAR2(255 char),
    NAME VARCHAR2(255 char),
    POOL_PROPERTIES CLOB
);

create table EEC_EVENT
(
    ID NUMBER(10) not null
        primary key,
    DESCRIPTION VARCHAR2(4000 char),
    DETAILS CLOB,
    EVENT_SOURCE VARCHAR2(2000 char),
    NODE_ID VARCHAR2(255 char),
    SEVERITY VARCHAR2(255 char),
    TIME TIMESTAMP(6),
    TYPE VARCHAR2(255 char)
);

create table EEC_GLOBAL_PROPERTIES
(
    PROPERTY_NAME VARCHAR2(255 char) not null
        primary key,
    PROPERTY_VALUE VARCHAR2(255 char)
);

create table EEC_LICENSE_CONFIGURATION
(
    ID VARCHAR2(255 char) not null
        primary key,
    LICENSE_CHECK_RESULT CLOB,
    RECORD_DATE TIMESTAMP(6),
    REQUEST_ID VARCHAR2(255 char)
);

create table EEC_NODE
(
    ID VARCHAR2(255 char) not null
        primary key,
    IP VARCHAR2(255 char)
);

create table EEC_NODE_METRIC
(
    ID NUMBER(19) not null
        primary key,
    AVERAGE_ACTIVE_JOBS FLOAT not null,
    AVERAGE_CANCELLED_JOBS FLOAT not null,
    AVERAGE_CPU_LOAD FLOAT not null,
    AVERAGE_JOB_EXECUTE_TIME FLOAT not null,
    AVERAGE_JOB_WAIT_TIME FLOAT not null,
    AVERAGE_REJECTED_JOBS FLOAT not null,
    AVERAGE_WAITING_JOBS FLOAT not null,
    BUSY_TIME_PERCENTAGE FLOAT not null,
    CREATED_DATE TIMESTAMP(6),
    CURRENT_ACTIVE_JOBS NUMBER(10) not null,
    CURRENT_CANCELLED_JOBS NUMBER(10) not null,
    CURRENT_CPU_LOAD FLOAT not null,
    CURRENT_DAEMON_THREAD_COUNT NUMBER(10) not null,
    CURRENT_GC_CPU_LOAD FLOAT not null,
    CURRENT_IDLE_TIME NUMBER(19) not null,
    CURRENT_JOB_EXECUTE_TIME NUMBER(19) not null,
    CURRENT_JOB_WAIT_TIME NUMBER(19) not null,
    CURRENT_REJECTED_JOBS NUMBER(10) not null,
    CURRENT_THREAD_COUNT NUMBER(10) not null,
    CURRENT_WAITING_JOBS NUMBER(10) not null,
    HEAP_MEMORY_COMMITTED NUMBER(19) not null,
    HEAP_MEMORY_INITIALIZED NUMBER(19) not null,
    HEAP_MEMORY_MAXIMUM NUMBER(19) not null,
    HEAP_MEMORY_TOTAL NUMBER(19) not null,
    HEAP_MEMORY_USED NUMBER(19) not null,
    IDLE_TIME_PERCENTAGE FLOAT not null,
    LAST_DATA_VERSION NUMBER(19) not null,
    LAST_UPDATE_TIME NUMBER(19) not null,
    MAXIMUM_ACTIVE_JOBS NUMBER(10) not null,
    MAXIMUM_CANCELLED_JOBS NUMBER(10) not null,
    MAXIMUM_JOB_EXECUTE_TIME NUMBER(19) not null,
    MAXIMUM_JOB_WAIT_TIME NUMBER(19) not null,
    MAXIMUM_REJECTED_JOBS NUMBER(10) not null,
    MAXIMUM_THREAD_COUNT NUMBER(10) not null,
    MAXIMUM_WAITING_JOBS NUMBER(10) not null,
    NODE_ID VARCHAR2(255 char),
    NODE_START_TIME NUMBER(19) not null,
    NON_HEAP_MEMORY_COMMITTED NUMBER(19) not null,
    NON_HEAP_MEMORY_INITIALIZED NUMBER(19) not null,
    NON_HEAP_MEMORY_MAXIMUM NUMBER(19) not null,
    NON_HEAP_MEMORY_TOTAL NUMBER(19) not null,
    NON_HEAP_MEMORY_USED NUMBER(19) not null,
    OUTBOUND_MESSAGES_QUEUE_SIZE NUMBER(10) not null,
    RECEIVED_BYTES_COUNT NUMBER(19) not null,
    RECEIVED_MESSAGES_COUNT NUMBER(10) not null,
    SENT_BYTES_COUNT NUMBER(19) not null,
    SENT_MESSAGES_COUNT NUMBER(10) not null,
    START_TIME NUMBER(19) not null,
    TOTAL_BUSY_TIME NUMBER(19) not null,
    TOTAL_CANCELLED_JOBS NUMBER(10) not null,
    TOTAL_CPUS NUMBER(10) not null,
    TOTAL_EXECUTED_JOBS NUMBER(10) not null,
    TOTAL_EXECUTED_TASKS NUMBER(10) not null,
    TOTAL_IDLE_TIME NUMBER(19) not null,
    TOTAL_NODES NUMBER(10) not null,
    TOTAL_REJECTED_JOBS NUMBER(10) not null,
    TOTAL_STARTED_THREAD_COUNT NUMBER(19) not null,
    UP_TIME NUMBER(19) not null
);

create table EEC_OPERATION_LOG
(
    ID NUMBER(10) not null
        primary key,
    INPUT CLOB,
    METHOD VARCHAR2(255 char),
    NAME VARCHAR2(255 char),
    OUTPUT CLOB,
    OWNER_NAME VARCHAR2(255 char),
    OWNER_TYPE VARCHAR2(255 char),
    RESULT VARCHAR2(255 char),
    TIME TIMESTAMP(6)
);

create table EEC_PRIVILEGES
(
    ID NUMBER(10) not null
        primary key,
    CATEGORY VARCHAR2(255 char),
    NAME VARCHAR2(255 char)
);

create table EEC_PROFILES
(
    ID NUMBER(10) not null
        primary key,
    CREATED_BY VARCHAR2(255 char),
    DESCRIPTION VARCHAR2(1000 char),
    NAME VARCHAR2(255 char)
        constraint eec_prof_name_uq
            unique
);

create table EEC_APPLICATION
(
    ID NUMBER(10) not null
        primary key,
    DESCRIPTION VARCHAR2(4000 char),
    NAME VARCHAR2(100 char)
        constraint eec_app_name_uq
            unique,
    TOKEN VARCHAR2(4000 char)
        constraint eec_app_tkn_uq
            unique,
    PROFILE_ID NUMBER(10)
        constraint eec_app_profile_fk
            references EEC_PROFILES
);

create table EEC_PROFILE_LNK_PRIVILEGES
(
    PRIVILEGE_ID NUMBER(10) not null
        constraint eec_prf_lnk_prv_prv_fk
            references EEC_PRIVILEGES,
    PROFILE_ID NUMBER(10) not null
        constraint eec_prf_lnk_prv_prf_fk
            references EEC_PROFILES,
    GRANTED_BY VARCHAR2(255 char),
    primary key (PRIVILEGE_ID, PROFILE_ID)
);

create table EEC_USER_LOGIN_ATTEMPT_LOG
(
    ID NUMBER(10) not null
        primary key,
    RESULT VARCHAR2(255 char),
    TIME TIMESTAMP(6),
    USER_ALIAS VARCHAR2(255 char)
);

create table EEC_USERS
(
    USER_ID NUMBER(10) not null
        primary key,
    ALIAS VARCHAR2(255 char),
    CREATED_BY VARCHAR2(255 char),
    FIRST_NAME VARCHAR2(255 char),
    PASSWORD VARCHAR2(255 char),
    PASSWORD2 VARCHAR2(255 char),
    PASSWORD3 VARCHAR2(255 char),
    PWD_CHANGE_DATE TIMESTAMP(6),
    SURNAME VARCHAR2(255 char),
    TFA_KEY VARCHAR2(255 char),
    PROFILE_ID NUMBER(10)
        constraint eec_usr_prf_fk
            references EEC_PROFILES
);

create table EEC_USER_TOKEN
(
    ID NUMBER(10) not null
        primary key,
    ACCESS_EXPIRY_DATE TIMESTAMP(6),
    ACCESS_TOKEN VARCHAR2(2000 char),
    APPLICATION_CODE VARCHAR2(255 char),
    REFRESH_EXPIRY_DATE TIMESTAMP(6),
    REFRESH_TOKEN VARCHAR2(2000 char),
    USER_ID NUMBER(10)
        constraint eec_tkn_usr_fk
            references EEC_USERS
);
