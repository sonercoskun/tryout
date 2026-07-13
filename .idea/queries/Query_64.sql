select * from UMCSYS.UFONE_SMS_BBC_COLONE_TEST order by VAR_DATA_3 DESC; --10962379
select * from UMCSYS.UFONE_SMS_BBC_COLONE_TEST where VAR_DATA_3 is not null order by VAR_DATA_3 desc;
select * from UMCSYS.PTML_CHN_SMS_BC WHERE MSISDN ='923376580852';

select * from

select * from V$SQL where sql_id='kq5yyq7usvdp';
select * from V$SQL where sql_id='c948mg5xn7909';
select * from V$SQL where SQL_TEXT ='INSERT INTO UMCSYS.UFONE_SMS_BBC_COLONE_TEST (SMS_STATUS,MSISDN,SMS_TYPE,OPTIN_CODE,SMS_TEXT,TITLE,START_HOUR,END_HOUR,CAMPAIGN_CODE,VAR_DATA_1,LAST_CHANGE) VALUES (:1 ,:2 ,:3 ,:4 ,:5 ,:6 ,:7 ,:8 ,:9 ,:10 ,:11 )';

SELECT program_id, program_line#, sql_text
FROM V$SQL VS , ALL_USERS AU
WHERE (executions >= 1)
  AND (parsing_user_id != 0)
  AND (AU.user_id(+) = VS.parsing_user_id)
  AND UPPER(AU.USERNAME)  IN (UPPER('EVAM_SYS'))
ORDER BY last_active_time DESC;

9a2pw0dfu04u4;

select sesion.sid,
       sql_text
from v$sqltext sqltext, v$session sesion
where sesion.sql_hash_value = sqltext.hash_value
  and sesion.sql_address = sqltext.address
  and sesion.username is not null
order by sqltext.piece;

select inst_id, program, module, SQL_ID, machine
from gv$session
where type!='BACKGROUND'
  and status='ACTIVE'
  and sql_id is not null;

set line 200 pages 200
select s.module,sql_text
from v$sqltext_with_newlines t,V$SESSION s
where t.address = s.sql_address
  and t.hash_value = s.sql_hash_value
  and s.status = 'ACTIVE'
  and s.username is not null
order by s.sid,t.piece;


select sesion.sid,
       sesion.username,
       optimizer_mode,
       hash_value,
       address,
       cpu_time,
       elapsed_time,
       sql_text
from v$sqlarea sqlarea, v$session sesion
where sesion.sql_hash_value = sqlarea.hash_value
  and sesion.sql_address = sqlarea.address
  and sesion.username is not null;

select * from UMCSYS.PTML_CHN_SMS_BC where VAR_DATA_3 > SYSDATE;