CREATE TABLE IF NOT EXISTS evam.segment_schedule
(
    id bigint NOT NULL,
    scenario_name character varying(255)  NOT NULL,
    segment_code character varying(255)  NOT NULL,
    cron character varying(255)  NOT NULL,
    CONSTRAINT segment_schedule_pkey PRIMARY KEY (id)
);
create sequence segments_schedule_seq;
commit;