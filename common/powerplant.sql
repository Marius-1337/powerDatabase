PU EIC Code	PU Name	Valid From	Valid To	PU Status	PU Type	PU Location	"PU Installed Capacity"	Control Area	Bidding Zone	Last Update	PU Voltage
GU Code	GU Name	GU Status	GU Type	GU Location	"GU Installed
Capacity"

54W-KOMAN0000066	KOMANG	01.01.2017	Infinity	COMMISSIONED	B12	Drin River Valley	600.00	10YAL-KESH-----5	10YAL-KESH-----5		220.00	54W-KOMAN-G30097	KOMANG3	COMMISSIONED	B12	Koman	150.00
54W-KOMAN0000066	KOMANG	01.01.2017	Infinity	COMMISSIONED	B12	Drin River Valley	600.00	10YAL-KESH-----5	10YAL-KESH-----5		220.00	54W-KOMAN-G4010H	KOMANG4	COMMISSIONED	B12	Koman	150.00
54W-KOMAN0000066	KOMANG	01.01.2017	Infinity	COMMISSIONED	B12	Drin River Valley	600.00	10YAL-KESH-----5	10YAL-KESH-----5		220.00	54W-KOMAN-G2008E	KOMANG2	COMMISSIONED	B12	Koman	150.00
54W-KOMAN0000066	KOMANG	01.01.2017	Infinity	COMMISSIONED	B12	Drin River Valley	600.00	10YAL-KESH-----5	10YAL-KESH-----5		220.00	54W-KOMAN-G1007L	KOMANG1	COMMISSIONED	B12	Koman	150.00
54W-FIERZ000001A	FIERZAG	01.01.2017	Infinity	COMMISSIONED	B12	Drin River Valley	500.00	10YAL-KESH-----5	10YAL-KESH-----5		220.00	54W-FIERZ-G2003I	FIERZAG2	COMMISSIONED	B12	Fierze	125.00
54W-FIERZ000001A	FIERZAG	01.01.2017	Infinity	COMMISSIONED	B12	Drin River Valley	500.00	10YAL-KESH-----5	10YAL-KESH-----5		220.00	54W-FIERZ-G1002P	FIERZAG1	COMMISSIONED	B12	Fierze	125.00
54W-FIERZ000001A	FIERZAG	01.01.2017	Infinity	COMMISSIONED	B12	Drin River Valley	500.00	10YAL-KESH-----5	10YAL-KESH-----5		220.00	54W-FIERZ-G40054	FIERZAG4	COMMISSIONED	B12	Fierze	125.00
54W-FIERZ000001A	FIERZAG	01.01.2017	Infinity	COMMISSIONED	B12	Drin River Valley	500.00	10YAL-KESH-----5	10YAL-KESH-----5		220.00	54W-FIERZ-G3004B	FIERZAG3	COMMISSIONED	B12	Fierze	125.00
54W-FANGU----21F	FANGU	01.01.2021	Infinity	COMMISSIONED	B12	FAN River	72.00	10YAL-KESH-----5	10YAL-KESH-----5		220.00


-- common.powerplant definition

-- Drop table

-- DROP TABLE common.powerplant;

CREATE TABLE common.powerplant (
	id serial4 NOT NULL,
	eic varchar(16) NOT NULL,
	"name" varchar NOT NULL,
	validfrom date NOT NULL,
	validthrough date NULL,
	status varchar NULL,
	fueltype int4 NOT NULL,
  location varchar,
  capacity int2,
  ctlarea int4 NOT NULL,
  bidarea int4 NOT NULL,
  voltage int4,
  datasource int4 NOT NULL,
  lastupdate TIMESTAMPTZ NOT NULL,
	CONSTRAINT powerplant_pk PRIMARY KEY (id)
);

-- common.powerplant foreign keys
CREATE UNIQUE INDEX eic_uniquepowerplant_index ON powerplant(eic);

ALTER TABLE common.powerplant ADD CONSTRAINT powerplant_fueltype_fk FOREIGN KEY (fueltype) REFERENCES common.fueltype(id);
ALTER TABLE common.powerplant ADD CONSTRAINT powerplant_ctlarea_fk FOREIGN KEY (ctlarea) REFERENCES common.area(id);
ALTER TABLE common.powerplant ADD CONSTRAINT powerplant_bidarea_fk FOREIGN KEY (bidarea) REFERENCES common.area(id);