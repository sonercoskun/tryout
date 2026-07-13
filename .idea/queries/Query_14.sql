CREATE TABLE IF NOT EXISTS segment_schedule
(
    id bigint NOT NULL,
    scenario_name character varying(255) COLLATE pg_catalog.“default” NOT NULL,
    segment_code character varying(255) COLLATE pg_catalog.“default” NOT NULL,
    cron character varying(255) COLLATE pg_catalog.“default” NOT NULL,
    CONSTRAINT segment_schedule_pkey PRIMARY KEY (id)
);