-- ==========================================
-- File: create_triggers.sql
-- Group 6
-- Members: Pratik Aryal, Baburam, Junaid
-- Purpose: Create audit table and triggers
-- ==========================================

USE RDFinal;
GO

-- Create Audit table
CREATE TABLE Audit (
    ID INT IDENTITY(1,1) PRIMARY KEY,
    Message VARCHAR(255),
    Timestamp DATETIME DEFAULT GETDATE()
);
GO

-- Trigger: log new customer creation
CREATE TRIGGER trg_NewCustomer
ON Customer
AFTER INSERT
AS
BEGIN
    INSERT INTO Audit (Message)
    SELECT 'New customer added: ' + Fname + ' ' + Lname
    FROM inserted;
END;
GO

-- Trigger: log loan payment
CREATE TRIGGER trg_LoanPayment
ON LoanPayment
AFTER INSERT
AS
BEGIN
    INSERT INTO Audit (Message)
    SELECT 'Loan payment made: $' + CAST(Amount AS VARCHAR(20))
    FROM inserted;
END;
GO

-- Trigger: log new savings account
CREATE TRIGGER trg_NewSavingsAccount
ON SavingsAccount
AFTER INSERT
AS
BEGIN
    INSERT INTO Audit (Message)
    SELECT 'New savings account opened: ID ' + CAST(SaAccountId AS VARCHAR(10))
    FROM inserted;
END;
GO

-- Test triggers
-- INSERT INTO Customer (Fname, Lname, Phone, Address, AccountManager) VALUES ('Test', 'User', '1234567890', '123 Main', 1);
-- INSERT INTO LoanPayment (Amount, PaymentDate) VALUES (500, GETDATE());
-- INSERT INTO SavingsAccount (Balance, LastAccess, DateOpened, InterestRate) VALUES (1000, GETDATE(), GETDATE(), 0.02);
-- SELECT * FROM Audit;
