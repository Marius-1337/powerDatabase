CREATE TABLE meteorology.measurements (
    created_at TIMESTAMPTZ NOT NULL,
    datetime TIMESTAMPTZ NOT NULL,
    duration INTERVAL NOT NULL,
	measurement serial4 NOT NULL,
    value FLOAT NOT NULL,
   	datasource serial4 NOT NULL,

    PRIMARY KEY (datetime,area_id,duration,fueltype,datasource),
    CONSTRAINT fk_actual_gen_area FOREIGN KEY (area_id) REFERENCES common.area(id) ON DELETE CASCADE,
 );

-- Convert to hypertable
SELECT create_hypertable('meteorology.measurements', 'datetime', chunk_time_interval => INTERVAL '1 month');