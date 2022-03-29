/* Database schema to keep the structure of entire database. */
CREATE TABLE animals (
  id int GENERATED ALWAYS AS IDENTITY (START WITH 1 INCREMENT BY 1) NOT NULL PRIMARY KEY,
  name varchar(50),
  date_of_birth date,
  escape_attempts int,
  neutered boolean,
  weight_kg decimal
);

ALTER TABLE animals
  ADD species varchar(50);

CREATE TABLE owners (
  id int GENERATED ALWAYS AS IDENTITY (START WITH 1 INCREMENT BY 1) NOT NULL PRIMARY KEY,
  full_name varchar(100) NOT NULL,
  age smallint NOT NULL
);

CREATE TABLE species (
  id int GENERATED ALWAYS AS IDENTITY (START WITH 1 INCREMENT BY 1) NOT NULL PRIMARY KEY,
  name varchar(50) NOT NULL
);

ALTER TABLE animals
  DROP COLUMN id;

ALTER TABLE animals
  ADD id INT GENERATED ALWAYS AS IDENTITY (START WITH 1 INCREMENT 1) NOT NULL PRIMARY KEY;

ALTER TABLE animals
  DROP COLUMN species;

ALTER TABLE animals
  ADD species_id INT REFERENCES species (id);

ALTER TABLE animals
  ADD owner_id INT REFERENCES owners (id);

CREATE TABLE vets (
  id int GENERATED ALWAYS AS IDENTITY (START WITH 1 INCREMENT BY 1) NOT NULL PRIMARY KEY,
  name varchar(30) NOT NULL,
  age int NOT NULL,
  date_of_graduation date NOT NULL
);

CREATE TABLE specializations (
  vets_id int REFERENCES vets (id) ON UPDATE CASCADE,
  species_id int REFERENCES species (id) ON UPDATE CASCADE,
  PRIMARY KEY (vets_id, species_id)
);

CREATE TABLE visits (
  id serial,
  vets_id int REFERENCES vets (id) ON UPDATE CASCADE,
  animals_id int REFERENCES animals (id) ON UPDATE CASCADE,
  visit_date date,
  PRIMARY KEY (id, vets_id, animals_id)
);

ALTER TABLE owners
  ADD COLUMN email VARCHAR(120);

ALTER TABLE owners
  ALTER COLUMN age DROP NOT NULL;

CREATE INDEX idx_visits_animals ON visits (animals_id);

CREATE INDEX idx_visits_vetsId ON visits (vets_id);

CREATE INDEX owners_email ON owners (email);

