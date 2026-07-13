select * from insert_date_p;

CREATE TABLE int_log_table_2024_12_25 PARTITION OF int_log_table
    FOR VALUES FROM ('2024-12-25') TO ('2024-12-26');