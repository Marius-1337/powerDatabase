-- Measurement Type Table

START TRANSACTION;
SET SCHEMA 'common';

CREATE TABLE meteomeasurement (
    mm_type_id SERIAL PRIMARY KEY,
    mm_name VARCHAR(50) NOT NULL,
    unit VARCHAR(20) NOT NULL,
    validtime VARCHAR(100) NOT NULL, 
    longdescription TEXT NULL
);
COMMIT;



