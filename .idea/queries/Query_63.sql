SELECT TO_CHAR(AVG(EXTRACT(HOUR FROM VAR_DATA_3) * 60 + EXTRACT(MINUTE FROM VAR_DATA_3)), 'FM9990.00') AS avg_time_in_minutes
FROM PTML_CHN_SMS_BBC;

SELECT program_id, program_line#, sql_text
FROM V$SQL VS , ALL_USERS AU
WHERE (executions >= 1)
  AND (parsing_user_id != 0)
  AND (AU.user_id(+) = VS.parsing_user_id)
  AND UPPER(AU.USERNAME)  IN (UPPER('EVAM_SYS'))
ORDER BY last_active_time DESC;

select * from UMCSYS.UFONE_SMS_BBC_COLONE_TEST where MSISDN='923525623325';