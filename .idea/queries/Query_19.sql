-- Delete orphaned large objects to free up space:
DO $$
    DECLARE
        lob_oid OID;
    BEGIN
        FOR lob_oid IN
            SELECT lo.oid
            FROM pg_largeobject_metadata lo
                     LEFT JOIN pg_depend dep
                               ON lo.oid = dep.objid
            WHERE dep.objid IS NULL
            LOOP
                PERFORM lo_unlink(lob_oid);
            END LOOP;
    END $$;

create table  orphantablo as SELECT lo.oid
FROM pg_largeobject_metadata lo
         LEFT JOIN pg_depend dep
                   ON lo.oid = dep.objid
WHERE dep.objid IS NULL;

select count(*) from orphantablo;

select count(loid) from pg_largeobject;