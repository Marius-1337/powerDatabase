
START TRANSACTION;
SET SCHEMA 'common';
SET CONSTRAINTS ALL DEFERRED;

CREATE TABLE common.asset (
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

ALTER TABLE common.asset DROP CONSTRAINT IF EXISTS asset_datasource_fk;
ALTER TABLE common.asset ADD CONSTRAINT asset_datasource_fk FOREIGN KEY (datasource) REFERENCES common.datasource(id);

ALTER TABLE common.asset DROP CONSTRAINT IF EXISTS asset_fueltype_fk;
ALTER TABLE common.asset ADD CONSTRAINT asset_fueltype_fk FOREIGN KEY (fueltype) REFERENCES common.fueltype(id);

COMMIT;

-- using WGS 84 notation, needs discussion
INSERT INTO common.asset 
(eic, assetname, latitude, longitude, elevation, fueltype, capacity, datasource, lastupdate) VALUES
('UNKNOWN', 'Seamade Mermaid wind farm', 51.63, 2.86, 0, 21, 235, 4, '2024-09-24');