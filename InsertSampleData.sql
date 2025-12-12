-- ==========================================
-- File: InsertSampleData.sql
-- Group 6
-- Members: Pratik Aryal, Baburam, Junaid
-- Purpose: Insert sample data for testing Phase 2 features
-- ==========================================

USE RDFinal;
GO

-- =========================
-- Insert Roles
-- =========================
INSERT INTO Role (RoleName) VALUES ('Teller');
INSERT INTO Role (RoleName) VALUES ('Loan Officer');
INSERT INTO Role (RoleName) VALUES ('Manager');
INSERT INTO ROLE (RoleName) VALUES ('Account Manager');

-- =========================
-- Insert Locations
-- =========================
INSERT INTO Location (LocationType, Address) VALUES ('Branch', '123 Main St, Calgary');
INSERT INTO Location (LocationType, Address) VALUES ('Branch', '456 Centre St, Calgary');
INSERT INTO Location (LocationType, Address) VALUES ('Office', '111 1st St, Calgary');
INSERT INTO Location (LocationType, Address) VALUES ('N/A', 'Work From Home');


-- =========================
-- Insert Employees
-- =========================
INSERT INTO Employee (Fname, Lname, Phone, Address, StartDate, IsManager, RoleId, ManagerId)
VALUES 
('Alice', 'Smith', '4031112222', '12 Elm St', GETDATE(), 1, 3, NULL),
('Bob', 'Brown', '4033334444', '34 Oak St', GETDATE(), 0, 1, 1),
('Charlie', 'Davis', '4035556666', '56 Pine St', GETDATE(), 0, 2, 1),
('Darcy', 'May', '5874445555', '99 Home St', GETDATE(), 0, 4, 1);

-- =========================
-- Assign Employee to Locations
-- =========================
INSERT INTO EmployeeLocation (EmployeeId, LocationId)
VALUES (1, 3), (2, 1), (3, 2), (4, 4);

-- =========================
-- Insert Customers
-- =========================
INSERT INTO Customer (Fname, Lname, Phone, Address, AccountManager)
VALUES 
('David', 'Lee', '4037778888', '78 Maple St', 4),
('Eva', 'Wong', '4039990000', '90 Cedar St', 4);

-- =========================
-- Insert Chequing Accounts
-- =========================
INSERT INTO ChequingAccount (Balance, LastAccess, DateOpened)
VALUES (1500, GETDATE(), GETDATE()), (2500, GETDATE(), GETDATE());

-- Link Customers to Chequing Accounts
INSERT INTO CustomerChequingAccount (CustomerID, ChAccountId)
VALUES (1,1), (2,2);

-- =========================
-- Insert Savings Accounts
-- =========================
INSERT INTO SavingsAccount (Balance, LastAccess, DateOpened, InterestRate)
VALUES (5000, GETDATE(), GETDATE(), 0.02), (3000, GETDATE(), GETDATE(), 0.015);

-- Link Customers to Savings Accounts
INSERT INTO CustomerSavingsAccount (CustomerID, SaAccountId)
VALUES (1,1), (2,2);

-- =========================
-- Insert Loan Payments
-- =========================
INSERT INTO LoanPayment (Amount, PaymentDate)
VALUES (200, GETDATE()), (500, GETDATE());

-- =========================
-- Insert Loan Accounts
-- =========================
INSERT INTO LoanAccount (Balance, LastAccess, PaymentId, LoanOfficerId)
VALUES (10000, GETDATE(), 1, 2),
       (5000, GETDATE(), 2, 3);

-- Link Customers to Loan Accounts
INSERT INTO CustomerLoanAccount (CustomerID, LoanAccountId)
VALUES (1,1), (2,2);

-- =========================
GO
-- Insert JSON extra info for Customers
-- =========================
UPDATE Customer
SET ExtraInfo = '{"PreferredContact":"Email","Newsletter":true}'
WHERE CustomerId IN (1,2);

-- =========================
-- Insert spatial data for Branches
-- =========================
UPDATE Location
SET BranchLocation = geography::Point(51.0447, -114.0719, 4326)
WHERE LocationId = 1;

UPDATE Location
SET BranchLocation = geography::Point(51.0501, -114.0853, 4326)
WHERE LocationId = 2;

UPDATE Location
SET BranchLocation = geography::Point(27.988935, 86.922275, 4326)
WHERE LocationId = 3;

SELECT * FROM Employee