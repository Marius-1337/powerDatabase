CREATE TABLE common.datasource (
	id serial4 NOT NULL,
	name varchar NOT NULL,
	fullname varchar NULL,
  	url varchar NULL,
  	owner varchar NOT NULL,
  	lastupdate timestamptz NOT NULL,
	CONSTRAINT datasource_pk PRIMARY KEY (id)
);

INSERT INTO common.datasource ("name", fullname, url, "owner", lastupdate) VALUES('ENTSO-e', 'ENTSO-e', 'entsoe.eu', 'Marius', '2024-05-07 00:00:00.000');