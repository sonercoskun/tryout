SELECT name, value
FROM v$parameter
WHERE name = 'sessions';
SELECT COUNT(*)
FROM v$session;
select current_utilization, limit_value
from v$resource_limit
where resource_name='sessions';