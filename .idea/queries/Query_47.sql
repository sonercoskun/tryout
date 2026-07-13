DO
$$
    DECLARE
        lo_oid         oid;
        countersuccess INT := 0;
        counterfail    INT := 0;
        countertotal   INT := 0;
    BEGIN
        FOR lo_oid IN
            SELECT oid
            FROM orphantablo
            LOOP
                BEGIN
                    PERFORM lo_unlink(lo_oid);
                    countersuccess := countersuccess + 1;
                    IF countersuccess % 1000 = 0 THEN
                        commit;
                    END IF;
                EXCEPTION
                    WHEN others THEN
                        counterfail := counterfail + 1;
                END;
                countertotal := countertotal + 1;
                IF countertotal % 100000 = 0 THEN
                    RAISE NOTICE 'COUNTER SUCCESSS % / counter fail % / counter total %',countersuccess,counterfail,countertotal;
                END IF;
            END LOOP;

        -- Final log after all operations
        commit;
        RAISE NOTICE 'Completed processing % records.', countertotal;
    END
$$;

   -- SILME SORGUSU
DO $$
    DECLARE
        lo_oid OID;
        counter INT := 0;
    BEGIN
        FOR lo_oid IN
            SELECT dt.loid
            FROM (select loid from pg_largeobject where data = '[]' and  pageno = 0 limit 10000) dt
            LOOP
                PERFORM lo_unlink(lo_oid);
                counter := counter + 1;
                RAISE NOTICE 'LOID %',lo_oid;
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

select * from  pg_largeobject where loid = 92897509;
select lo_get(92894346);

SELECT COUNT(*) FROM pg_largeobject where pageno = 0;