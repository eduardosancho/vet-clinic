CREATE TABLE patients (
  id int GENERATED ALWAYS AS IDENTITY (START WITH 1 INCREMENT BY 1) NOT NULL PRIMARY KEY,
  name varchar(50),
  date_of_birth date
);

CREATE TABLE invoices (
    id int GENERATED ALWAYS AS IDENTITY (START WITH 1 INCREMENT BY 1) NOT NULL PRIMARY KEY,
    total_amount decimal,
    generated_at timestamp,
    payed_at timestamp
);

CREATE TABLE invoice_items (
    id int GENERATED ALWAYS AS IDENTITY (START WITH 1 INCREMENT BY 1) NOT NULL PRIMARY KEY,
    unit_price decimal,
    quantity int,
    total_price decimal
);

CREATE TABLE medical_histories (
    id int GENERATED ALWAYS AS IDENTITY (START WITH 1 INCREMENT BY 1) NOT NULL PRIMARY KEY,
    admitted_at timestamp,
    status varchar(50)
);

CREATE TABLE treatments (
  id int GENERATED ALWAYS AS IDENTITY (START WITH 1 INCREMENT BY 1) NOT NULL PRIMARY KEY,
  type varchar(50),
  name varchar(50)
);

ALTER TABLE invoices
  ADD medical_history_id int REFERENCES medical_histories (id) ON UPDATE CASCADE;

ALTER TABLE invoice_items 
  ADD invoice_id int REFERENCES invoices (id) ON UPDATE CASCADE,
  ADD treatment_id int REFERENCES treatments (id) ON UPDATE CASCADE;

ALTER TABLE medical_histories
  ADD patient_id int REFERENCES patients (id) ON UPDATE CASCADE;

CREATE TABLE treatment_histories (
  medical_histories_id int REFERENCES medical_histories (id) ON UPDATE CASCADE,
  treatments_id int REFERENCES treatments (id) ON UPDATE CASCADE,
  PRIMARY KEY (medical_histories_id, treatments_id)
);

CREATE INDEX idx_medical_histories_treatment_histories ON treatment_histories (medical_histories_id); 
CREATE INDEX idx_treatments_treatment_histories ON treatment_histories (treatments_id);

CREATE INDEX idx_medical_histories_patients ON medical_histories (patient_id);

CREATE INDEX idx_invoices_medical_histories ON invoices (medical_history_id);

CREATE INDEX idx_invoice_items_invoices ON invoice_items (invoice_id);
CREATE INDEX idx_invoice_items_treaments ON invoice_items (treatment_id);
