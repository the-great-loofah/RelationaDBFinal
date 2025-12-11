-- ==========================================
-- File: create_indexes.sql
-- Group 6
-- Members: Pratik Aryal, Baburam, Junaid
-- Purpose: Create clustered and non-clustered indexes
-- ==========================================

USE RDFinal;
GO

-- Clustered index on non-key column (ChequingAccount LastAccess)
CREATE CLUSTERED INDEX idx_Chequing_LastAccess
ON ChequingAccount (LastAccess);
GO

-- Composite clustered index (CustomerChequingAccount: CustomerID + ChAccountId)
CREATE CLUSTERED INDEX idx_CCA_Customer_Ch
ON CustomerChequingAccount (CustomerID, ChAccountId);
GO

-- Composite non-clustered index (LoanAccount: LoanOfficerId + LastAccess)
CREATE NONCLUSTERED INDEX idx_LoanAccount_OfficerLast
ON LoanAccount (LoanOfficerId, LastAccess);
GO
