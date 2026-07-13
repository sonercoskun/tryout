DO $$
    DECLARE
        lo_oid OID;
        counter INT := 0;
    BEGIN
        FOR lo_oid IN
            SELECT dt.loid
            FROM (select loid from pg_largeobject where data = '[]' and  pageno = 0 limit 1000) dt
            LOOP
                PERFORM lo_unlink(lo_oid);
                counter := counter + 1;

                -- Log every 1000 deletions
                IF counter % 10 = 0 THEN
                    RAISE NOTICE 'Processed % records so far.', counter;
                    commit;
                END IF;
            END LOOP;

        -- Final log after all operations
        RAISE NOTICE 'Completed processing % records.', counter;
    END
$$;

select count(*) from pg_largeobject; --2197660
ANALYZE pg_largeobject;