/* Database schema to keep the structure of entire database. */

CREATE TABLE animals(
  id INT GENERATED ALWAYS AS IDENTITY (START WITH 1 INCREMENT BY 1) NOT NULL PRIMARY KEY,
  name varchar(50),
  date_of_birth date,
  escape_attempts int,
  neutered boolean,
  weight_kg decimal
);

ALTER TABLE animals ADD species varchar(50);
