--Tad messy but assigns a intern role all then assigns all of us administrator acccess, passords are 12345, dont change your passwords please.



USE RDFinal CREATE ROLE BASIC
GO

USE RDFinal CREATE ROLE ADMIN AUTHORIZATION db_owner
GO

GRANT SELECT, INSERT, UPDATE ON Employee TO BASIC

GRANT sysadmin ON RDFinal TO ADMIN

USE RDFinal
CREATE LOGIN Intern WITH PASSWORD= '12345',
DEFAULT_DATABASE = RDFinal
--------------------------------------------------
CREATE LOGIN Junaid2 WITH PASSWORD = '12345',
DEFAULT_DATABASE= RDFinal

CREATE LOGIN Pratik WITH PASSWORD = '12345',
DEFAULT_DATABASE= RDFinal

CREATE LOGIN Baburam WITH PASSWORD = '12345',
DEFAULT_DATABASE= RDFinal
---------------------------------------------------
CREATE USER Bob FOR LOGIN Intern WITH DEFAULT_SCHEMA = RDFinal

CREATE USER Junaid FOR LOGIN Junaid2 WITH DEFAULT_SCHEMA = RDFinal
CREATE USER Pratik FOR LOGIN Pratik WITH DEFAULT_SCHEMA = RDFinal
CREATE USER Baburam FOR LOGIN Baburam WITH DEFAULT_SCHEMA = RDFinal

ALTER ROLE ADMIN ADD MEMBER Junaid
ALTER ROLE ADMIN ADD MEMBER Pratik
ALTER ROLE ADMIN ADD MEMBER Baburam

ALTER ROLE BASIC ADD MEMBER Bob