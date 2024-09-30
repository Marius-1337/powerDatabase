START TRANSACTION;
SET SCHEMA 'common';
SET CONSTRAINTS ALL DEFERRED;

CREATE TABLE asset (
    location_id SERIAL PRIMARY KEY,
    eic varchar(16) NOT NULL,
    assetname varchar(250) NOT NULL,
    latitude DECIMAL(9,6) NOT NULL,
    longitude DECIMAL(9,6) NOT NULL,
    elevation DECIMAL(6,2),
    fueltype int4 NOT NULL,
    capacity int2,
    datasource int4 NOT NULL, 
    lastupdate TIMESTAMPTZ NOT null
);

ALTER TABLE asset ADD CONSTRAINT asset_datasource_fk FOREIGN KEY (datasource) REFERENCES common.datasource(id) ON UPDATE CASCADE DEFERRABLE INITIALLY DEFERRED;
ALTER TABLE asset ADD CONSTRAINT asset_fueltype_fk FOREIGN KEY (fueltype) REFERENCES common.fueltype(id) ON UPDATE CASCADE DEFERRABLE INITIALLY DEFERRED;

COMMIT;