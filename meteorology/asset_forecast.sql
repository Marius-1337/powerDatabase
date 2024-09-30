CREATE TABLE meteorology.asset_forecast (
	model_runtime TIMESTAMPTZ not NULL,
	forecast_timestamp TIMESTAMPTZ NOT NULL,
	duration interval not NULL,
    location_id INT REFERENCES common.asset(location_id),
	meteomodel_id INT REFERENCES common.meteomodel(model_id),
    value DECIMAL(10,4) NOT null,
    measurement_type_id INT REFERENCES common.meteomeasurement(mm_type_id),
	datasource serial4 REFERENCES common.datasource(id),
    UNIQUE(model_runtime, forecast_timestamp,duration,location_id,meteomodel_id,measurement_type_id,datasource),
    CONSTRAINT meteo_forecast_asset_pk PRIMARY KEY (model_runtime, forecast_timestamp,duration,location_id,meteomodel_id,measurement_type_id,datasource)
);
