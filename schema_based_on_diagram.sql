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

CREATE TABLE invoice_items (
    id int GENERATED ALWAYS AS IDENTITY (START WITH 1 INCREMENT BY 1) NOT NULL PRIMARY KEY,
    unit_price decimal,
    quantity int,
    total_price decimal,
    invoice_id int REFERENCES invoices (id) ON UPDATE CASCADE,
    treatment_id int REFERENCES treatments (id) ON UPDATE CASCADE,
);

CREATE TABLE medical_histories (
    id int GENERATED ALWAYS AS IDENTITY (START WITH 1 INCREMENT BY 1) NOT NULL PRIMARY KEY,
    admitted_at timestamp,
    status varchar(50),
    patient_id int REFERENCES patients (id) ON UPDATE CASCADE,
);

CREATE TABLE treatments (
  id int GENERATED ALWAYS AS IDENTITY (START WITH 1 INCREMENT BY 1) NOT NULL PRIMARY KEY,
  type varchar(50),
  name varchar(50),
);
