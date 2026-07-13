307067425485114027 UNİ
307087425503659373 LDVEW;


SELECT
    QueryID,
    UserName,
    StartTime,
    FirstRespTime,
    TotalIOCount,
    StatementType
FROM
    DBC.DBQLogTbl
WHERE
    UserName = 'EVAM_CMS';

SELECT
    L.LogDate,
    L.QueryID,
    L.UserName,
    S.SQLTsqext AS QueryText,
    L.StartTime,
    L.FirstRespTime,
    L.TotalIOCount
FROM
    DBC.DBQLogTbl L
        JOIN
    DBC.DBQLSQLTbl S
    ON L.ProcID = S.ProcID
        AND L.QueryID = S.QueryID
WHERE
    L.UserName = 'EVAM_CMS'
ORDER BY
    L.LogDate DESC;



DBQLSqlTbl

SELECT TableName
FROM DBC.Tables
WHERE DatabaseName = 'DBC'
  AND TableName LIKE 'DBQ%';

