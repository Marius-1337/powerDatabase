CREATE TABLE area.actual_total_load (
    created_at TIMESTAMPTZ DEFAULT NOW(),
    datetime TIMESTAMPTZ NOT NULL,
    area_id INT NOT NULL,
    duration INTERVAL NOT NULL,          -- Duration stored as INTERVAL
    value FLOAT NOT NULL,
   	datasource serial4 NOT NULL,
    PRIMARY KEY (created_at,datetime, area_id,duration,datasource),
    CONSTRAINT fk_actual_load_area_area FOREIGN KEY (area_id) REFERENCES common.area(id) ON DELETE CASCADE,
    CONSTRAINT fk_actual_load_area_datasource FOREIGN KEY(datasource) REFERENCES common.datasource(id) ON DELETE CASCADE
);

-- Convert actual_total_load to hypertable
SELECT create_hypertable('area.actual_total_load', 'datetime', chunk_time_interval => INTERVAL '1 month');
