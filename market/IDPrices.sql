CREATE TABLE market.IDPrices (
	creation_ts timestamptz NOT NULL,
	actual_ts timestamptz NOT NULL,
    area_id INT NOT NULL,
	price float NOT NULL, 
	datasource serial4 NOT NULL,
	UNIQUE(creation_ts,actual_ts,area_id,datasource),
    CONSTRAINT market_ID_pk PRIMARY KEY (creation_ts,actual_ts,area_id,datasource)
);

-- common.border foreign keys
ALTER TABLE market.IDPrices ADD CONSTRAINT areacode_market_IDPrices FOREIGN KEY (area_id) REFERENCES common.area(id);
ALTER TABLE market.IDPrices ADD CONSTRAINT datasource_market_IDPrices FOREIGN KEY(datasource) REFERENCES common.datasource(id);