CREATE TABLE conversion.entsoe-fueltype (
	id serial4 NOT NULL,
    entsoecode varchar(3),
	name varchar NOT NULL,
	name varchar NULL,
	CONSTRAINT fueltype_pk PRIMARY KEY (id)
);


INSERT INTO common.fueltype(entsoecode, name) VALUES('A03', 'Mixed');
INSERT INTO common.fueltype(entsoecode, name) VALUES('A04','Generation');
INSERT INTO common.fueltype(entsoecode, name) VALUES('A05','Load');
INSERT INTO common.fueltype(entsoecode, name) VALUES('B01','Biomass');
INSERT INTO common.fueltype(entsoecode, name) VALUES('B02','Fossil Brown coal/Lignite');
INSERT INTO common.fueltype(entsoecode, name) VALUES('B03','Fossil Coal-derived gas');
INSERT INTO common.fueltype(entsoecode, name) VALUES('B04','Fossil Gas');
INSERT INTO common.fueltype(entsoecode, name) VALUES('B05','Fossil Hard coal');
INSERT INTO common.fueltype(entsoecode, name) VALUES('B06','Fossil Oil');
INSERT INTO common.fueltype(entsoecode, name) VALUES('B07','Fossil Oil shale');
INSERT INTO common.fueltype(entsoecode, name) VALUES('B08','Fossil Peat');
INSERT INTO common.fueltype(entsoecode, name) VALUES('B09','Geothermal');
INSERT INTO common.fueltype(entsoecode, name) VALUES('B10','Hydro Pumped Storage');
INSERT INTO common.fueltype(entsoecode, name) VALUES('B11','Hydro Run-of-river and poundage');
INSERT INTO common.fueltype(entsoecode, name) VALUES('B12','Hydro Water Reservoir');
INSERT INTO common.fueltype(entsoecode, name) VALUES('B13','Marine');
INSERT INTO common.fueltype(entsoecode, name) VALUES('B14','Nuclear');
INSERT INTO common.fueltype(entsoecode, name) VALUES('B15','Other renewable');
INSERT INTO common.fueltype(entsoecode, name) VALUES('B16','Solar');
INSERT INTO common.fueltype(entsoecode, name) VALUES('B17','Waste');
INSERT INTO common.fueltype(entsoecode, name) VALUES('B18','Wind Offshore');
INSERT INTO common.fueltype(entsoecode, name) VALUES('B19','Wind Onshore');
INSERT INTO common.fueltype(entsoecode, name) VALUES('B20','Other');
INSERT INTO common.fueltype(entsoecode, name) VALUES('B21','AC Link');
INSERT INTO common.fueltype(entsoecode, name) VALUES('B22','DC Link');
INSERT INTO common.fueltype(entsoecode, name) VALUES('B23','Substation');