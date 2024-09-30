-- Model Table

START TRANSACTION;
SET SCHEMA 'common';

CREATE TABLE meteoModel (
    model_id SERIAL PRIMARY KEY,
    model_name VARCHAR(50) NOT NULL
);

COMMIT;