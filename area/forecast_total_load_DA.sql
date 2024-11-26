-- Create the day_ahead_total_load_forecast table with duration as INTERVAL
CREATE TABLE area.day_ahead_total_load_forecast (
    created_at TIMESTAMPTZ DEFAULT NOW(),
    datetime TIMESTAMPTZ NOT NULL,
    area_id INT NOT NULL,
    duration INTERVAL NOT NULL,          -- Duration stored as INTERVAL
    value FLOAT,
    PRIMARY KEY (datetime, area_id),
    CONSTRAINT fk_forecast_area FOREIGN KEY (area_id) REFERENCES common.area(id) ON DELETE CASCADE
);

-- Convert day_ahead_total_load_forecast to hypertable
SELECT create_hypertable('area.day_ahead_total_load_forecast', 'datetime', chunk_time_interval => INTERVAL '1 month');