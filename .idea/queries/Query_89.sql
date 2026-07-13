REVOKE TRUNCATE ON <table_name> FROM <username>;
GRANT SELECT ON ENG.CSV_READER TO TEST;
select * from ENG.CSV_READER;
TRUNCATE TABLE ENG.CSV_READER;

SELECT name, value
FROM v$parameter
WHERE name = 'sessions';
SELECT COUNT(*)
FROM v$session;
SELECT value FROM v$parameter WHERE name = 'processes';
SELECT value FROM v$parameter WHERE name = 'sessions';
SELECT sid, serial#, username, status, osuser, machine, program FROM v$session WHERE status = 'ACTIVE';
SELECT count(*) FROM v$session WHERE status = 'ACTIVE';
SELECT a.sid, a.serial#, a.username, b.sid AS blocking_sid
FROM v$session a
         JOIN v$session b ON a.blocking_session = b.sid
WHERE a.blocking_session != 0;