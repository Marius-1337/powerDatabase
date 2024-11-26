CREATE TABLE area.actual_generation (
	creation_ts timestamptz NOT NULL,
	actual_ts timestamptz NOT NULL,
	area varchar(16) NOT NULL,
	fueltype serial4 NOT NULL, 
	datasource serial4 NOT NULL,
	value float4 NOT NULL,
	UNIQUE(creation_ts,actual_ts,area,fueltype,datasource),
    CONSTRAINT area_actual_generation_pk PRIMARY KEY (creation_ts,actual_ts,area,fueltype,datasource)
);

SELECT create_hypertable('area.actual_generation', by_range('actual_ts'));
CREATE INDEX idx_actualgen_time ON area.actual_generation (creation_ts,actual_ts DESC);

-- common.border foreign keys
ALTER TABLE area.actual_generation ADD CONSTRAINT areacode_actual_generation FOREIGN KEY (area) REFERENCES common.area(eic);
ALTER TABLE area.actual_generation ADD CONSTRAINT fueltype_actual_generation FOREIGN KEY (fueltype) REFERENCES common.fueltype(id);
ALTER TABLE area.actual_generation ADD CONSTRAINT datasource_actual_generation FOREIGN KEY(datasource) REFERENCES common.datasource(id);