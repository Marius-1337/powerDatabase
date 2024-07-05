
-- common.fueltype definition

-- Drop table

-- DROP TABLE common.fueltype;

CREATE TABLE common.fueltype (
	id serial4 NOT NULL,
	name varchar NOT NULL,
	description varchar NULL,
	CONSTRAINT fueltype_pk PRIMARY KEY (id)
);

INSERT INTO common.fueltype(name) VALUES('Mixed');
INSERT INTO common.fueltype(name) VALUES('Generation');
INSERT INTO common.fueltype(name) VALUES('Load');
INSERT INTO common.fueltype(name) VALUES('Biomass');
INSERT INTO common.fueltype(name) VALUES('Fossil Brown coal/Lignite');
INSERT INTO common.fueltype(name) VALUES('Fossil Coal-derived gas');
INSERT INTO common.fueltype(name) VALUES('Fossil Gas');
INSERT INTO common.fueltype(name) VALUES('Fossil Hard coal');
INSERT INTO common.fueltype(name) VALUES('Fossil Oil');
INSERT INTO common.fueltype(name) VALUES('Fossil Oil shale');
INSERT INTO common.fueltype(name) VALUES('Fossil Peat');
INSERT INTO common.fueltype(name) VALUES('Geothermal');
INSERT INTO common.fueltype(name) VALUES('Hydro Pumped Storage');
INSERT INTO common.fueltype(name) VALUES('Hydro Run-of-river and poundage');
INSERT INTO common.fueltype(name) VALUES('Hydro Water Reservoir');
INSERT INTO common.fueltype(name) VALUES('Marine');
INSERT INTO common.fueltype(name) VALUES('Nuclear');
INSERT INTO common.fueltype(name) VALUES('Other renewable');
INSERT INTO common.fueltype(name) VALUES('Solar');
INSERT INTO common.fueltype(name) VALUES('Waste');
INSERT INTO common.fueltype(name) VALUES('Wind Offshore');
INSERT INTO common.fueltype(name) VALUES('Wind Onshore');
INSERT INTO common.fueltype(name) VALUES('Other');
INSERT INTO common.fueltype(name) VALUES('AC Link');
INSERT INTO common.fueltype(name) VALUES('DC Link');
INSERT INTO common.fueltype(name) VALUES('Substation');
