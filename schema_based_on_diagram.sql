CREATE TABLE patients (
    id int GENERATED ALWAYS AS IDENTITY (START WITH 1 INCREMENT BY 1) NOT NULL PRIMARY KEY,
    name varchar(50),
    date_of_birth date,
);

CREATE TABLE invoices (
    id int GENERATED ALWAYS AS IDENTITY (START WITH 1 INCREMENT BY 1) NOT NULL PRIMARY KEY,
    total_amount decimal,
    generated_at timestamp,
    payed_at timestamp,
    medical_history_id int REFERENCES medical_histories (id) ON UPDATE CASCADE,
);

CREATE TABLE medical_histories (
    id int GENERATED ALWAYS AS IDENTITY (START WITH 1 INCREMENT BY 1) NOT NULL PRIMARY KEY,
    admitted_at timestamp,
    status varchar(50),
    patient_id int REFERENCES patients (id) ON UPDATE CASCADE,
);

