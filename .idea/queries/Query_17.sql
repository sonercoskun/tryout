select * from int_operation_log;
select * from pg_largeobject where loid = 18028;


select count(loid) from pg_largeobject;
select max(loid) from pg_largeobject;

SELECT lo_unlink(17920);
select count(loid) from pg_largeobject;

select count(pl.loid) from int_operation_log iol join pg_largeobject pl
    on (pl.loid = iol.operation_input::oid)
         where iol.operation_time < CURRENT_DATE - INTERVAL '1 month';

select * from (select * from int_operation_log order by operation_time limit 100) iol join pg_largeobject pl
                                                                                           on (pl.loid = iol.operation_input::oid);

10026188 pg large count
7722470 joinli sorgu =>   op input = 2795882 / op output = 4926588
496693  op log

10026189 count
7218875
2180530

2581882 max

select * from int_operation_log where operation_details is not null order by operation_time desc;



{"method":"POST","headers":null,"pathParameters":{},"queryParameters":{},"body":{"user":{"alias":"hassan","name":"Hassan","surname":"Razza","password":"Evam123","profileId":1}}}
{"method":"GET","headers":null,"pathParameters":{},"queryParameters":{},"body":null}
{"method":"PUT","headers":null,"pathParameters":{"scenarioName":"map01"},
pageno = 0;

create table loidInputyedek as (select pl.loid from int_operation_log iol join pg_largeobject pl on (pl.loid = iol.operation_input::oid)
where pl.pageno = 0 and pl.data like '{"method"%');

select count(*) from loidOutputyedek;


(select * from int_operation_log iol join pg_largeobject pl on (pl.loid = iol.operation_output::oid)
                                where pl.pageno = 0);


select count(*) from pg_largeobject where pageno = 0;
1 488 708


select count(loid) from pg_largeobject where data like '0x%';

select distinct substr(data,0,5) abc from pg_largeobject where pageno = 0;
select substr(data,0,5) abc,count (*) from pg_largeobject where pageno = 0 group by substr(data,0,5);

select * from pg_largeobject where loid in (260767,260768,260769);

select encode(cast(lo_get(260767) as varchar),'hex');
select encode(lo_get(51468), 'escape');
select lo_get(260767);

SELECT *
FROM pg_largeobject
WHERE pageno = 0
  AND data LIKE decode('ACED', 'hex') || '%';


SELECT lo.loid,lo.data,dep.objid
FROM pg_largeobject lo
         LEFT JOIN pg_depend dep
                   ON lo.loid = dep.objid
WHERE dep.objid IS NULL and lo.pageno = 0;


select * from pg_largeobject where data = '[]' and  pageno = 0 limit 1000;
