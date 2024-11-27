CREATE TABLE area.day_ahead_total_load_forecast (
    created_at TIMESTAMPTZ DEFAULT NOW(),
    datetime TIMESTAMPTZ NOT NULL,
    area_id INT NOT NULL,
    duration INTERVAL NOT NULL,          
    value FLOAT,
   	datasource serial4 NOT NULL,
    PRIMARY KEY (created_at,datetime, area_id, duration, datasource),
    CONSTRAINT fk_forecast_area_area FOREIGN KEY (area_id) REFERENCES common.area(id) ON DELETE CASCADE,
    CONSTRAINT fk_forecast_area_datasource FOREIGN KEY(datasource) REFERENCES common.datasource(id) ON DELETE CASCADE
);

-- Convert day_ahead_total_load_forecast to hypertable
SELECT create_hypertable('area.day_ahead_total_load_forecast', 'datetime', chunk_time_interval => INTERVAL '1 month');