create table if not exists evam.int_custom_offer_status
(
    id            bigint generated always as identity (start with 1 minvalue 0)
        primary key,
    offer_uuid    varchar(50)
        constraint int_custom_offer_status_uuid_idx
            unique,
    scenario_name varchar(250),
    description   varchar(4000),
    offer_name    varchar(250)
);
commit;