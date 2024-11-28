CREATE TABLE area.actual_generation (
    created_at TIMESTAMPTZ NOT NULL,
    datetime TIMESTAMPTZ NOT NULL,
    area_id INT NOT NULL,
    duration INTERVAL NOT NULL,
	fueltype serial4 NOT NULL,
    value FLOAT NOT NULL,
   	datasource serial4 NOT NULL,
    PRIMARY KEY (datetime,area_id,duration,fueltype,datasource),
    CONSTRAINT fk_actual_gen_area FOREIGN KEY (area_id) REFERENCES common.area(id) ON DELETE CASCADE,
    CONSTRAINT fk_actual_gen_datasource FOREIGN KEY(datasource) REFERENCES common.datasource(id) ON DELETE CASCADE,
	CONSTRAINT fk_actual_gen_fueltype FOREIGN KEY (fueltype) REFERENCES common.fueltype(id) ON DELETE CASCADE,
    CONSTRAINT area_actual_generation_unique UNIQUE (datetime, area_id, duration, fueltype, datasource)
);

-- Convert to hypertable
SELECT create_hypertable('area.actual_generation', 'datetime', chunk_time_interval => INTERVAL '1 month');