-- ==========================================
-- File: create_json_spatial.sql
-- Group 6
-- Members: Pratik Aryal, Baburam, Junaid
-- Purpose: Add JSON and spatial columns
-- ==========================================

USE RDFinal;
GO

-- Add JSON column to Customer table
ALTER TABLE Customer
ADD ExtraInfo NVARCHAR(MAX);  -- store JSON as NVARCHAR
GO

-- Insert sample JSON
UPDATE Customer
SET ExtraInfo = '{"PreferredContact":"Email","Newsletter":true}'
WHERE CustomerId = 1;
GO

-- Add spatial column to Location table
ALTER TABLE Location
ADD BranchLocation GEOGRAPHY;
GO

-- Insert sample spatial data (latitude, longitude)
UPDATE Location
SET BranchLocation = geography::Point(51.0447, -114.0719, 4326)
WHERE LocationId = 1;

UPDATE Location
SET BranchLocation = geography::Point(51.0501, -114.0853, 4326)
WHERE LocationId = 2;
GO
