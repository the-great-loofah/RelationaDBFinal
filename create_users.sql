-- ==========================================
-- File: create_users.sql
-- Group 6
-- Members: Pratik Aryal, Baburam, Junaid
-- Purpose: Create users and assign privileges
-- ==========================================

USE RDFinal;
GO

-- Create logins
CREATE LOGIN customer_group_6 WITH PASSWORD = 'customer';
CREATE LOGIN accountant_group_6 WITH PASSWORD = 'accountant';
GO

-- Create users
CREATE USER customer_group_6 FOR LOGIN customer_group_6 WITH DEFAULT_SCHEMA = dbo;
CREATE USER accountant_group_6 FOR LOGIN accountant_group_6 WITH DEFAULT_SCHEMA = dbo;
GO

-- Grant privileges
-- Customer group: read-only on customer-related tables
GRANT SELECT ON Customer TO customer_group_6;
GRANT SELECT ON ChequingAccount TO customer_group_6;
GRANT SELECT ON SavingsAccount TO customer_group_6;
GRANT SELECT ON LoanAccount TO customer_group_6;
GRANT SELECT ON LoanPayment TO customer_group_6;
GO

-- Accountant group: read on all tables
GRANT SELECT ON Employee TO accountant_group_6;
GRANT SELECT ON Role TO accountant_group_6;
GRANT SELECT ON Location TO accountant_group_6;
GRANT SELECT ON Customer TO accountant_group_6;
GRANT SELECT ON ChequingAccount TO accountant_group_6;
GRANT SELECT ON SavingsAccount TO accountant_group_6;
GRANT SELECT ON LoanAccount TO accountant_group_6;
GRANT SELECT ON LoanPayment TO accountant_group_6;
GRANT SELECT ON Overdraft TO accountant_group_6;
GRANT SELECT ON EmployeeLocation TO accountant_group_6;
GRANT SELECT ON CustomerChequingAccount TO accountant_group_6;
GRANT SELECT ON CustomerSavingsAccount TO accountant_group_6;
GRANT SELECT ON CustomerLoanAccount TO accountant_group_6;

-- Deny update on accounts, payments, loans for accountant
DENY UPDATE ON ChequingAccount TO accountant_group_6;
DENY UPDATE ON SavingsAccount TO accountant_group_6;
DENY UPDATE ON LoanAccount TO accountant_group_6;
DENY UPDATE ON LoanPayment TO accountant_group_6;
GO

-- Test statements
-- Connect as customer_group_6 and try to select
-- EXECUTE AS USER = 'customer_group_6';
-- SELECT * FROM Customer;
-- SELECT * FROM Employee; -- should fail

-- Connect as accountant_group_6 and try to update
-- EXECUTE AS USER = 'accountant_group_6';
-- UPDATE LoanAccount SET Balance = 0; -- should fail
-- SELECT * FROM Employee; -- should succeed
