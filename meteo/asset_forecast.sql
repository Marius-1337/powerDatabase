

CREATE TABLE meteorology.asset_forecast (
	model_runtime TIMESTAMPTZ not NULL,
	forecast_timestamp TIMESTAMPTZ NOT NULL,
	duration interval not NULL,
    location_id INT REFERENCES common.asset(location_id),
	meteomodel_id INT REFERENCES common.meteomodel(model_id),
    value DECIMAL(10,4) NOT null,
    measurement_type_id INT REFERENCES common.meteomeasurement(measurement_type_id),
	datasource serial4 INT REFERENCES common.datasourcet(datasourceid)
    UNIQUE(model_runtime, forecast_timestamp,duration,location_id,modetomodel_id,measurement_type_id,datasourceid),
    CONSTRAINT meteo_forecast_asset_pk PRIMARY KEY (model_runtime, forecast_timestamp,duration,location_id,modetomodel_id,measurement_type_i,datasourceid)
);

ALTER TABLE meteorology.asset_forecast ADD CONSTRAINT location_id FOREIGN KEY (location_id) REFERENCES common.asset(location_id);
ALTER TABLE meteorology.asset_forecast ADD CONSTRAINT meteomodel_id FOREIGN KEY (meteomodel_id) REFERENCES common.meteomodel(model_id);
ALTER TABLE meteorology.asset_forecast ADD CONSTRAINT measurement_type_id FOREIGN KEY (location_id) REFERENCES common.asset(location_id);
ALTER TABLE meteorology.asset_forecast ADD CONSTRAINT datasource FOREIGN KEY (location_id) REFERENCES common.asset(location_id);
