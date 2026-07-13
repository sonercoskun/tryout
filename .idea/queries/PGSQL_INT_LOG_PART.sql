-- Table: public.int_log_table

-- DROP TABLE IF EXISTS public.int_log_table;

CREATE TABLE IF NOT EXISTS public.int_log_table_part
(
    id numeric(22,0) NOT NULL DEFAULT nextval('log_seq'::regclass),
    actorid character varying(80) COLLATE pg_catalog."default",
    scenario_name character varying(80) COLLATE pg_catalog."default",
    previous_state character varying(80) COLLATE pg_catalog."default",
    state character varying(80) COLLATE pg_catalog."default",
    event_params character varying(4000) COLLATE pg_catalog."default",
    event character varying(200) COLLATE pg_catalog."default",
    message character varying(1200) COLLATE pg_catalog."default",
    action_name character varying(80) COLLATE pg_catalog."default",
    action_template_name character varying(80) COLLATE pg_catalog."default",
    action_rtcode numeric(22,0),
    log_time timestamp without time zone NOT NULL,
    log_insert_time timestamp without time zone,
    event_id character varying(40) COLLATE pg_catalog."default",
    validations character varying(2000) COLLATE pg_catalog."default",
    scenario_hist_id integer,
    CONSTRAINT int_log_table_part_pkey PRIMARY KEY (id, log_time),
    CONSTRAINT int_log_table_part_scenario_hist_id_fkey FOREIGN KEY (scenario_hist_id)
        REFERENCES public.int_scenario_hist (id) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION
) PARTITION BY RANGE (log_time);

ALTER TABLE IF EXISTS public.int_log_table_part
    OWNER to evam;

REVOKE ALL ON TABLE public.int_log_table_part FROM hopi;

GRANT ALL ON TABLE public.int_log_table_part TO evam;

GRANT SELECT ON TABLE public.int_log_table_part TO hopi;

-- Partitions SQL

create table public.int_log_table_p20241227 PARTITION OF public.int_log_table_part for values from  ('2024-12-27') TO ('2024-12-28');
create table public.int_log_table_p20241228 PARTITION OF public.int_log_table_part for values from  ('2024-12-28') TO ('2024-12-29');
create table public.int_log_table_p20241229 PARTITION OF public.int_log_table_part for values from  ('2024-12-29') TO ('2024-12-30');
create table public.int_log_table_p20241230 PARTITION OF public.int_log_table_part for values from  ('2024-12-30') TO ('2024-12-31');
create table public.int_log_table_p20241231 PARTITION OF public.int_log_table_part for values from  ('2024-12-31') TO ('2025-01-01');
create table public.int_log_table_p20250101 PARTITION OF public.int_log_table_part for values from  ('2025-01-01') TO ('2025-01-02');
create table public.int_log_table_p20250102 PARTITION OF public.int_log_table_part for values from  ('2025-01-02') TO ('2025-01-03');
create table public.int_log_table_p20250103 PARTITION OF public.int_log_table_part for values from  ('2025-01-03') TO ('2025-01-04');
create table public.int_log_table_p20250104 PARTITION OF public.int_log_table_part for values from  ('2025-01-04') TO ('2025-01-05');
create table public.int_log_table_p20250105 PARTITION OF public.int_log_table_part for values from  ('2025-01-05') TO ('2025-01-06');
create table public.int_log_table_pdefault  PARTITION OF public.int_log_table_part DEFAULT;


ALTER TABLE public.int_log_table RENAME TO int_log_table_old;
ALTER TABLE public.int_log_table_part RENAME TO int_log_table;

select * from int_log_table_old;


create index int_log_table_actorid_idx on int_log_table(actorid);
create index int_log_table_scenario_name_idx on int_log_table(scenario_name);
create index int_log_table_state_idx on int_log_table(state);

----CRON
#!/bin/bash

# Get the next day's date in YYYYMMDD format
DAY_DATE=$(date -d '+1 day' +%Y%m%d)

# Log the current date and add a separator in the log file
date >> /tmp/part.txt
echo "------------------------------------------------------" >> /tmp/part.txt

# Calculate the range for the partition: one and two days later
ONE_DAY_LATER=$(date -d '+1 day' +%Y-%m-%d)
TWO_DAYS_LATER=$(date -d '+2 days' +%Y-%m-%d)

# Create the partition for the next day in PostgreSQL

echo "CREATE TABLE IF NOT EXISTS public.int_log_table_p${DAY_DATE} PARTITION OF public.int_log_table FOR VALUES FROM ('${ONE_DAY_LATER}') TO ('${TWO_DAYS_LATER}');" >> /tmp/part.txt

psql -d evamdb -c "CREATE TABLE IF NOT EXISTS public.int_log_table_p${DAY_DATE} PARTITION OF public.int_log_table FOR VALUES FROM ('${ONE_DAY_LATER}') TO ('${TWO_DAYS_LATER}');" >> /tmp/part.txt 2>&1

# Optional: Remove partitions older than 7 days
# Uncomment and adjust if necessary
# DAY_7_BEFORE=$(date -d '-7 days' +%Y%m%d)
# psql -d evamdb -c "DROP TABLE IF EXISTS public.int_log_table_p${DAY_7_BEFORE};" >> /tmp/part.txt 2>&1



