USE RDFinal
GO

CREATE PROC sp_hires
AS
SELECT Fname, Lname, StartDate FROM Employee
WHERE YEAR(StartDate) = YEAR(GETDATE()) ORDER BY StartDate;

EXEC sp_hires
GO

CREATE PROC sp_findmanagers
AS
SELECT Fname, Lname FROM Employee
WHERE IsManager = 1


EXEC sp_findmanagers