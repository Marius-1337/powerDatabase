CREATE TABLE market.DAPrices (
	creation_ts timestamptz NOT NULL,
	actual_ts timestamptz NOT NULL,
	area varchar(16) NOT NULL,
	price float NOT NULL, 
	datasource serial4 NOT NULL,
	UNIQUE(creation_ts,actual_ts,area,datasource),
    CONSTRAINT market_DA_pk PRIMARY KEY (creation_ts,actual_ts,area,datasource)
);

-- common.border foreign keys
ALTER TABLE market.DAPrices ADD CONSTRAINT areacode_market_DAPrices FOREIGN KEY (area) REFERENCES common.area(eic);
ALTER TABLE market.DAPrices ADD CONSTRAINT datasource_market_DAPrices FOREIGN KEY(datasource) REFERENCES common.datasource(id);