SELECT name, value
FROM v$parameter
WHERE name = 'sessions';
SELECT COUNT(*)
FROM v$session;