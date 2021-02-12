
-- Switch to the system (aka master) database
USE master;
GO

-- Delete the Animal_Hospital Database (IF EXISTS)
IF EXISTS(select * from sys.databases where name='Animal_Hospital')
DROP DATABASE Animal_Hospital;
GO

-- Create a new Animal_Hospital Database
CREATE DATABASE Animal_Hospital;
GO

-- Switch to the Animal_Hospital Database
USE Animal_Hospital
GO

-- Begin a TRANSACTION that must complete with no errors
BEGIN TRANSACTION;

CREATE TABLE Owner (  --We made the simplifying asumption that there is only 1 owner
    Owner_id integer identity NOT NULL,
    name varchar(64) NOT NULL,
    address varchar(128) NOT NULL,
    PhoneNumber varchar(9) NOT NULL, --Assuming US phone numbers
	CONSTRAINT pk_Owner_Owner_id PRIMARY KEY (Owner_id)
);

CREATE TABLE Pet (
	Pet_id integer identity NOT NULL,
    name varchar(64) NOT NULL,
	type varchar(64) NOT NULL,
    age smallint NOT NULL,
	Owner_id integer NOT NULL,
	CONSTRAINT pk_Pet_Pet_id PRIMARY KEY (Pet_id)
);

CREATE TABLE Medical_Procedure (
	Procedure_id integer identity NOT NULL,
    name varchar(128) NOT NULL,
	cost decimal(12,2) NOT NULL,
	CONSTRAINT pk_Medical_Procedure_Procedure_id PRIMARY KEY (Procedure_id)
);

CREATE TABLE Visit_Medical_Procedure (
	Procedure_id integer NOT NULL,
    Visit_id integer NOT NULL,
	CONSTRAINT pk_Visit_Medical_Procedure_Procedure_id_Visit_id PRIMARY KEY (Procedure_id, Visit_id)
);

CREATE TABLE Visit_log (
	Visit_id integer identity Not Null,
	Pet_id integer Not Null,
	Procedure_id integer NOT NULL,
	day_of_prodecure date not Null,
	CONSTRAINT pk_Visit_log_Visit_id PRIMARY KEY (Visit_id)
);

CREATE TABLE Invoice (
	Invoice_id integer identity NOT NULL,
    Visit_id integer NOT NULL,
	CONSTRAINT pk_Invoice_Invoice_id PRIMARY KEY (Invoice_id)
);

ALTER TABLE Pet
ADD FOREIGN KEY(Owner_id)
REFERENCES Owner(Owner_id);

ALTER TABLE Visit_log
ADD FOREIGN KEY(Pet_id)
REFERENCES Pet(Pet_id);

ALTER TABLE Visit_Medical_Procedure
ADD FOREIGN KEY(Visit_id)
REFERENCES Visit_log(Visit_id);

ALTER TABLE Visit_Medical_Procedure
ADD FOREIGN KEY(Procedure_id)
REFERENCES Medical_Procedure(Procedure_id);

ALTER TABLE Invoice
ADD FOREIGN KEY(Visit_id)
REFERENCES Visit_log(Visit_id);



COMMIT TRANSACTION;