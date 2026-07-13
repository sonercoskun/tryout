SELECT
    HostId,               -- Host identifier
    UserName,             -- User logged in
    ClientIpAddress,      -- Client IP address
    SessionNo,            -- Session number
    LogonTime,            -- Time the session was established
    DefaultDatabase       -- Default database for the session
FROM
    DBC.SessionInfoV
WHERE
    ClientIpAddress IS NOT NULL
ORDER BY
    LogonTime DESC;