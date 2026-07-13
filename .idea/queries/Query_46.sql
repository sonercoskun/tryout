select lo_get(449395809)
select
select * from INT_WORKSPACE where resources is not null
create table int_workspace_backup as select * from INT_WORKSPACE where resources is not null
select lo_get(2776717410) from int_workspace_backup
-------
select lo_get(287422)
select lo_get(cast(source_values as BIGINT)) from int_visualisation_source
select * from int_physical_connection ipc
select * from int_segment_ds_mapping isdm where "sql" = '20404'
    INT_LOYALTY_GIFT
INT_BENEFIT (son 2 gün kalacak şekilde azaldı)
INT_BLACK_LIST
INT_TARGET_LIST
INT_WORKSPACE
INT_SCENARIO_VERSION
select * from INT_WORKSPACE where id = 252 resources = '8042052'
select * from INT_WORKSPACE where thumbnail = '2484581'
update INT_WORKSPACE set thumbnail = null
select * from int_scenario_version isv where json_value = '9509999' or class_bytes = '9509999' or code = '9509999' or resources = '9509999'
select * from int_scenario_version isv where scenario_name = 'SLO_90D_DUMMY_SUBS'
select lo_get(8381409)
select * from INT_TARGET_LIST
select * from INT_BLACK_LIST
select * from INT_BENEFIT where tags = '287422' or custom_benefit_parameters = '287422' or merchants = '287422'
select lo_get(590771250)
select * from int_custom_communication_def iccd
select scenario_name, isd.status, iw.json_value, lo_get(cast(iw.json_value as BIGINT)) from int_scenario_def isd, int_workspace iw
where iw."name" = isd.scenario_name
select distinct abc.scenario_name from (select scenario_name, isd.status, iw.json_value from int_scenario_def isd, int_workspace iw
                                        where iw."name" = isd.scenario_name) abc left join pg_largeobject pg on pg.loid=cast(abc.json_value as BIGINT) where pg.data is null
select distinct iccd.name,lo_get(cast(iccd.parameters as BIGINT)) from int_custom_communication_def iccd left join pg_largeobject pg on pg.loid=cast(iccd.parameters as BIGINT) where pg.data is not null;
    45 tane yok.
 select * from int_scenario_offer iso left join pg_largeobject pg on pg.loid=cast(iso."content" as BIGINT) where pg.data is null
select * from int_custom_benefit_def icbd left join pg_largeobject pg on pg.loid=cast(icbd.parameters as BIGINT) where pg.data is not null;
    10 tane yok.
sadece bu 6sı
scenarioname in (C000007557
C000007570
C000007720
C000008300
C000008571
SLO_90D_DUMMY_SUBS)
select * from int_scenario_version isv where scenario_name in ('C000007557',
                                                               'C000007570',
                                                               'C000007720',
                                                               'C000008300',
                                                               'C000008571',
                                                               'SLO_90D_DUMMY_SUBS')
create table int_scenario_def_backup6 as select *
                                                    delete from int_scenario_def isv where scenario_name in ('C000007557',
                                                                                                             'C000007570',
                                                                                                             'C000007720',
                                                                                                             'C000008300',
                                                                                                             'C000008571',
                                                                                                             'SLO_90D_DUMMY_SUBS')
create table int_scenario_def_backup as select * from int_scenario_def
create table C000007570_backup as select * from C000007570_table
create table C000007720_backup as select * from C000007720_table
create table C000008300_backup as select * from C000008300_table
create table C000008571_backup as select * from C000008571_table
create table SLO_90D_DUMMY_SUBS_backup as select * from SLO_90D_DUMMY_SUBS_table



select * from int_visualisation_source;
select lo_get(cast(json_value as BIGINT)) from int_workspace where name ='C000007570';

select * from int_future_event ife
select
    a.VERSION,
    a.CLASS_BYTES,
    a.CODE,
    a.CREATE_TIME,
    a.CREATED_BY,
    a.JSON_VALUE,
    a.MESSAGE,
    a.RESOURCES,
    a.SCENARIO_NAME,
    a.APPLICATION_CODE
from
    evam.INT_SCENARIO_VERSION a
        join evam.INT_SCENARIO_DEF b on
        a.scenario_name = b.scenario_name
            and a.version = b.version and a.scenario_name = 'Test_BSMS'
select lo_get(2420463)
    2420463
    8367386
    8377893
    8381409
    9509975
select * from pg_largeobject where loid in (590771250) 9509999
select * from int_workspace iw where json_value = '9509999'
select * from int
select * from int_workspace iw where "name" =
                                     8042052
select * from int_workspace_folder iwf
select * from int_workspace where js;
select lo_get(cast(json_value as BIGINT)) from int_workspace where id=797;
select * from int_scenario_version where scenario_name ='C000006708';
select * from C000006971_table;
select * from int_scenario_def where scenario_name = 'C000006038';
select * from int_action where scenario_name = 'C000006971';
   select abc.scenario_name, abc.version, lo_get(cast(abc.json_value as BIGINT)) from int_scenario_version abc
       left join pg_largeobject pg on pg.loid=cast(abc.json_value as BIGINT) where pg.data is not null;
select * from int_workspace where name ='C000006971';
select * from int_scenario_comm_uq_code;
select distinct abc.scenario_name,abc.version, abc.json_value from (
                  SELECT
                      scenario_name,
                      json_value,
                      version,
                      RANK() OVER (PARTITION BY scenario_name ORDER BY version DESC) AS rank
                  FROM
                      int_scenario_version
              ) abc
                  left join pg_largeobject pg on pg.loid=cast(abc.json_value as BIGINT)
   inner join int_scenario_def isd on isd.scenario_name = abc.scenario_name
                                                                                           where pg.data is not null and abc.rank=2;


select distinct abc.scenario_name, abc.status, lo_get(cast(abc.json_value as BIGINT)) from (select scenario_name, isd.status, iw.json_value from int_scenario_def isd, int_workspace iw
                                        where iw."name" = isd.scenario_name) abc left join pg_largeobject pg on pg.loid=cast(abc.json_value as BIGINT) where pg.data is not null;

select * from C000007570_table;
--create table  C000007720_table_yedek as select * from TEST_BSMS_table;
select * from int_scenario_def where scenario_name ='Test_BSMS';
--drop table TEST_BSMS_table cascade;

select * from int_action where scenario_name='C000007720';

insert into C000007720_table
    select * from C000007720_table_table_yedek;

C000007570_table_yedek
C000007720_table_table_yedek;

select convert_from(lo_get(cast("sql" as bigint)),'UTF8') as cont, *  from int_segment_ds_mapping isc;

select * from int_segment_ds_mapping where id=2620;

SELECT relname, relnamespace::regnamespace AS schema_name, OID
FROM pg_class;

select count(actor_id) from int_seg_res_138723;



WITH used_loids AS (
    SELECT DISTINCT resources AS loid
    FROM int_workspace
),
     all_loids AS (
         SELECT DISTINCT loid
         FROM pg_largeobject
     )
SELECT loid
FROM all_loids
WHERE loid NOT IN (SELECT loid FROM used_loids);


WITH used_loids AS (
    SELECT DISTINCT resources AS loid
    FROM int_workspace
),
     all_loids AS (
         SELECT DISTINCT loid
         FROM pg_largeobject
     )
SELECT COUNT(loid) AS unused_count
FROM all_loids
WHERE loid NOT IN (SELECT loid FROM used_loids);

select * from C000007622_table;

SELECT table_name
FROM information_schema.tables
WHERE table_schema='evam'
  AND table_type='BASE TABLE' and table_name like '%_table';

select * from custom_benefit_parameters;

select * from pg_largeobject where loid = 17766;

select * from (select * from int_operation_log order by operation_time limit 100) iol join pg_largeobject pl
                                                      on (pl.loid = iol.operation_input::oid);

select * from (select * from int_operation_log order by operation_time limit 100) iol join pg_largeobject pl
                                                                                           on (pl.loid = iol.operation_input::oid);


select * from (select * from int_operation_log iol order by operation_time) a limit 100;

select count(pl.loid) from int_operation_log iol join pg_largeobject pl on (pl.loid = iol.operation_input::oid)
where pl.pageno = 0 and pl.data like '{"method"%';

select substr(data,0,10),loid from pg_largeobject where pageno = 0;

select substr(data,0,5) abc,count (*) from pg_largeobject where pageno = 0 group by substr(data,0,5);


SELECT count(loid)
FROM pg_largeobject
WHERE pageno = 0
  AND data LIKE decode('ACED', 'hex') || '%';

2 465 763 640

-postgre pg_largeobject tablosuna 'select' atıp sayıya bakıcaz
-%40 boş, %50 aşağıdaki data
    custom benefit datası java class 0xACED0005737200146A6176612E7574696C2E4C696E6B65644C6973740C29535D4A608822030000787077040000000D73720037636F6D2E6576616D2E6D61726B6574696E672E62656E656669742E6D6F64656C2E437573746F6D42656E65666974506172616D65746572428EAF9460FD3AC90200024C00046E616D657400124C6A6176612F6C616E672F537472696E673B4C000576616C756571007E000378707400064D534953444E74000C3932333336303435373137327371007E000274000D43414D504149474E5F434F444574000A433030303030353539337371007E000274000C50524F565F4348414E4E454C740001347371007E000274000A4F5054494E5F434F444574000555464F4E457371007E000274000E4F43535F50524F445543545F494474000834363337343339367371007E000274000B50524F565F535441545553740001317371007E000274000A5641525F444154415F317400044556414D7371007E000274000A5641525F444154415F327400104450524F565F433030303030353539337371007E000274000A5641525F444154415F33707371007E000274000A5441424C455F4E414D45740014554D435359532E50544D4C5F43484E5F50524F567371007E000274000C524551554553545F4441544574001C31382D4E6F762D32342030382E31362E31372E33303730303020414D7371007E00027400044D4F444574000A50524F44554354494F4E7371007E000274000B4C4153545F4348414E474574001C31382D4E6F762D32342030382E31362E31372E33303730303020414D78
    linkedlist tanım java class 0xACED0005737200146A6176612E7574696C2E4C696E6B65644C6973740C29535D4A608822030000787077040000000078
-int op log dan karşılığı method ile başlayan loid dataları silinebilir


create table  orphantabloNotNull as SELECT lo.oid
                             FROM pg_largeobject_metadata lo
                                      INNER JOIN pg_depend dep
                                                ON lo.oid = dep.objid;


select COUNT(*) from orphantabloNotNull;
SELECT LO_GET(16637);

SELECT oid, COUNT(*)
FROM orphantablo
GROUP BY oid
ORDER BY COUNT(*) DESC;


SELECT oid, COUNT(*)
FROM orphantablo
GROUP BY oid;
