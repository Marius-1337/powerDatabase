CREATE TABLE "unit" (
  id serial4 NOT NULL,
  eic varchar(16) NOT NULL,
  powerplant varchar(16) NOT NULL,
  name varchar NOT NULL,
  validfrom date NOT NULL,
  validthrough date NULL,
  status varchar NULL,
  fueltype int4 NOT NULL,
  location varchar,
  capacity int2,
  Datasource int4 NOT NULL, 
  lastupdate TIMESTAMPTZ NOT NULL,
  CONSTRAINT unit_pk PRIMARY KEY (id)
);


CREATE UNIQUE INDEX eic_uniqueunit_index ON unit(eic);

ALTER TABLE common.unit ADD CONSTRAINT unit_plant_fk FOREIGN KEY (powerplant) REFERENCES common.powerplant(eic);
ALTER TABLE common.unit ADD CONSTRAINT unit_fueltype_fk FOREIGN KEY (fueltype) REFERENCES common.fueltype(id);