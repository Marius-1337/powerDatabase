START TRANSACTION;

SET SCHEMA 'common';

CREATE TABLE if not exists common.geolocation (
	id serial4 NOT NULL,
	"name" varchar NOT NULL,
	coordinates point NOT null,
	lastupdate timestamptz NOT NULL,
	CONSTRAINT location_pk PRIMARY KEY (id)
);


COMMIT;