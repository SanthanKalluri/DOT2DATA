USE SqlMaskDemo
GO
CREATE TABLE dbo.Employee
(
 EmployeeId INT IDENTITY(1,1), Name NVARCHAR(100), DOJ DATETIME,
 EmailAddress NVARCHAR(100), Phone Varchar(15), Salary INT
)
GO
INSERT INTO dbo.Employee (Name, DOJ, EmailAddress,Phone, Salary)
Values
 ('Mahesh', '02/20/2005', 'mahesh.kalluru@gmail.com',
   '123-4567-789',900000),
 ('Raghu', '07/01/2015', 'santhan.kalluri@gmail.com',
   '123-4567-789',100000)
GO

select * from Employee

----------------------> Step 2
---Add DEFAULT() masking function on the Name column
USE SqlMaskDemo
GO
ALTER Table Employee
ALTER COLUMN NAME ADD MASKED WITH (FUNCTION='DEFAULT()');
 
---Add DEFAULT() masking function on the Name column
ALTER Table Employee
ALTER COLUMN DOJ ADD MASKED WITH (FUNCTION='DEFAULT()');

ALTER Table Employee
ALTER COLUMN EmailAddress 
 ADD MASKED WITH (FUNCTION='Email()');

 ALTER Table Employee
ALTER COLUMN Phone 
 ADD MASKED WITH (FUNCTION='Partial(2,"-ZZZ-",2)');

 ALTER Table Employee
ALTER COLUMN Salary ADD MASKED WITH (FUNCTION='Random(1000,90000)');

------------------------> Step 3 to display masking
--Create user reader
USE SqlMaskDemo
GO
CREATE USER reader WITHOUT LOGIN
--Grant select permission to the user: reader
GRANT SELECT ON Employee TO reader

EXECUTE AS USER = 'reader'
SELECT * FROM Employee
REVERT

EXECUTE AS USER = 'reader'
SELECT * FROM Employee 
WHERE EmailAddress = 'santhan.kalluri@gmail.com'
REVERT