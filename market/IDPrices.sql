CREATE TABLE market.IDPrices (
	creation_ts timestamptz NOT NULL,
	actual_ts timestamptz NOT NULL,
	area varchar(16) NOT NULL,
	price float NOT NULL, 
	datasource serial4 NOT NULL,
	UNIQUE(creation_ts,actual_ts,area,datasource),
    CONSTRAINT market_ID_pk PRIMARY KEY (creation_ts,actual_ts,area,datasource)
);

-- common.border foreign keys
ALTER TABLE market.IDPrices ADD CONSTRAINT areacode_market_IDPrices FOREIGN KEY (area) REFERENCES common.area(eic);
ALTER TABLE market.IDPrices ADD CONSTRAINT datasource_market_IDPrices FOREIGN KEY(datasource) REFERENCES common.datasource(id);