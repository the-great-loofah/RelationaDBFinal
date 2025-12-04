USE RDFinal;
GO
--=============================================================Low dependency tables-------
CREATE TABLE Location (
	LocationId INT IDENTITY(1,1) PRIMARY KEY,
	LocationType VARCHAR(255),
	Address VARCHAR(255)
)

CREATE TABLE Role (
	RoleId INT IDENTITY(1,1) PRIMARY KEY,
	RoleName VARCHAR(50)
)

CREATE TABLE Employee (
	EmployeeId INT IDENTITY(1,1) PRIMARY KEY,
	Fname VARCHAR (255),
	Lname VARCHAR (255),
	Phone VARCHAR (12),
	Address VARCHAR (255), --home address
	StartDate DATE,
	IsManager BIT,
	RoleId INT FOREIGN KEY REFERENCES Role(RoleId),
	ManagerId INT FOREIGN KEY REFERENCES Employee(EmployeeId), --So happy SQL lets us do this
	BranchId INT --FOREIGN KEY REFERENCES EmployeeLocation(LocationId),
	--CONSTRAINT FK_Branch_Location FOREIGN KEY (BranchId)
)

CREATE TABLE Customer (
	CustomerId INT IDENTITY(1,1) PRIMARY KEY,
	Fname VARCHAR (255),
	Lname VARCHAR (255),
	Phone VARCHAR (12),
	Address VARCHAR (255), --home address
	AccountManager INT FOREIGN KEY REFERENCES Employee(EmployeeId)
)

CREATE TABLE Overdraft (
	OverdraftId INT IDENTITY(1,1) PRIMARY KEY,
	Amount MONEY,
	OverDraftDate Date
)

CREATE TABLE LoanPayment (
	PaymentId INT IDENTITY(1,1) PRIMARY KEY,
	Amount MONEY,
	PaymentDate DATE
)

CREATE TABLE ChequingAccount (
	ChAccountId INT IDENTITY(1,1) PRIMARY KEY,
	Balance MONEY DEFAULT 0.00,
	LastAccess DATE,
	DateOpened DATE,
	Overdraft INT FOREIGN KEY REFERENCES Overdraft(OverdraftId)
)

CREATE TABLE SavingsAccount (
	SaAccountId INT IDENTITY(1,1) PRIMARY KEY,
	Balance MONEY DEFAULT 0.00,
	LastAccess DATE,
	DateOpened DATE,
	InterestRate FLOAT 
)

CREATE TABLE LoanAccount (
	LoanAccountId INT IDENTITY(1,1) PRIMARY KEY,
	Balance MONEY DEFAULT 0.00,
	LastAccess DATE,
	PaymentId INT FOREIGN KEY REFERENCES LoanPayment(PaymentId),
	LoanOfficerId INT FOREIGN KEY REFERENCES Employee(EmployeeId)
)

--===============================================Intermediary Tables
CREATE TABLE EmployeeLocation (
	EmployeeLocationId INT IDENTITY(1,1) PRIMARY KEY,
	EmployeeId INT FOREIGN KEY REFERENCES Employee(EmployeeId),
	LocationId INT FOREIGN KEY REFERENCES Location(LocationId),
)

CREATE TABLE CustomerChequingAccount (
	CCAId INT IDENTITY(1,1) PRIMARY KEY, --shortened names to reduce typing ;_; - J TO DO REMOVE THIS
	CustomerID INT FOREIGN KEY REFERENCES Customer(CustomerId),
	ChAccountId INT FOREIGN KEY REFERENCES ChequingAccount(ChAccountId)

)

CREATE TABLE CustomerSavingsAccount (
	CSAId INT IDENTITY(1,1) PRIMARY KEY,
	CustomerID INT FOREIGN KEY REFERENCES Customer(CustomerId),
	SaAccountId INT FOREIGN KEY REFERENCES SavingsAccount(SaAccountId)
)

CREATE TABLE CustomerLoanAccount (
	CLAId INT IDENTITY(1,1) PRIMARY KEY,
	CustomerID INT FOREIGN KEY REFERENCES Customer(CustomerId),
	LoanAccountId INT FOREIGN KEY REFERENCES LoanAccount(LoanAccountId)
)

--==================================================================================

ALTER TABLE Employee --updates the foreign key constraint for branchid in the employee table
	ADD FOREIGN KEY (BranchId) REFERENCES EmployeeLocation (LocationId);





