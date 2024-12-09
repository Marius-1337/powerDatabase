CREATE TABLE market.DAPrices (
	creation_ts timestamptz NOT NULL,
	actual_ts timestamptz NOT NULL,
    area_id INT NOT NULL,
	price float NOT NULL, 
	datasource serial4 NOT NULL,
	UNIQUE(creation_ts,actual_ts,area_id,datasource),
    CONSTRAINT market_DA_pk PRIMARY KEY (creation_ts,actual_ts,area_id,datasource)
);

ALTER TABLE market.DAPrices ADD CONSTRAINT areacode_market_DAPrices FOREIGN KEY (area_id) REFERENCES common.area(id);
ALTER TABLE market.DAPrices ADD CONSTRAINT datasource_market_DAPrices FOREIGN KEY(datasource) REFERENCES common.datasource(id);