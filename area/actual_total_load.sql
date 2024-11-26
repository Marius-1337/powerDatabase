CREATE TABLE area.actual_total_load (
    datetime TIMESTAMPTZ NOT NULL,
    area_id INT NOT NULL,
    duration INTERVAL NOT NULL,          -- Duration stored as INTERVAL
    value FLOAT NOT NULL,
    created_at TIMESTAMPTZ DEFAULT NOW(),
    PRIMARY KEY (datetime, area_id),
    CONSTRAINT fk_actual_load_area FOREIGN KEY (area_id) REFERENCES common.area(id) ON DELETE CASCADE
);

-- Convert actual_total_load to hypertable
SELECT create_hypertable('area.actual_total_load', 'datetime', chunk_time_interval => INTERVAL '1 month');
