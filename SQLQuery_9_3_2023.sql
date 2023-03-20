CREATE TABLE EmployeeSalary(
    Emp_ID int IDENTITY(1,1) NOT NULL,
    Emp_Name varchar(50) ,
    Emp_Salary int ,
    Emp_City varchar(50) ,
   
    PRIMARY KEY CLUSTERED ( Emp_ID ASC )
) ON [PRIMARY]

INSERT INTO EmployeeSalary values('Souvik Mandal', 25000, 'Beleghata'),
('Debmalya Samanta', 26000, 'Metia Burj'),
('Ujjal Kar', 25000, 'Bantala'), 
('Aishik Bera', 24000, 'Airport'), 
('Sohom Das', 28000, 'Shubhsh Nagar'), 
('Naru Kalyan', 20000, 'Bangalore'), 
('Omi Dutta', 23000, 'Kolkata');


select * from EmployeeSalary

CREATE TABLE EmployeeOrder(
    Order_ID int IDENTITY(1,1) NOT NULL,
    Emp_ID int ,
    Order_Name varchar(50) ,
    Order_Address varchar(50) 
   
    PRIMARY KEY CLUSTERED ( Order_ID ASC )
) ON [PRIMARY]

insert into EmployeeOrder values(1,'rice','home'),
			(3,'dal','office'),
			(4,'burger','home'),
			(7,'dosa','home'),
			(1,'chinease','office'),
			(4,'parata','office'),
			(2,'rooti','home');

select * from EmployeeOrder;
------------------------------------------------------------------------

-----------------------------------------
--trigger

CREATE TABLE Employee_Audit_Test  
(    
Id int IDENTITY(1,1),   
Audit_Action text   
)  
select * from Employee_Audit_Test
drop table Employee_Audit_Test
/*
CREATE TRIGGER trDeleteEmployee   
ON EmployeeSalary  
FOR DELETE  
AS  
BEGIN  
  Declare @Id int  
  SELECT @Id = Emp_ID from deleted  
  INSERT INTO Employee_Audit_Test  
  VALUES ('An existing employee with Id = ' + CAST(@Id AS VARCHAR(10)) + ' is deleted at ' + CAST(Getdate() AS VARCHAR(22)))  
END  

CREATE TRIGGER trinsertEmployee   
ON EmployeeSalary  
FOR Insert  
AS  
BEGIN  
  Declare @Id int  
  SELECT @Id = Emp_ID from inserted  
  INSERT INTO Employee_Audit_Test  
  VALUES ('An existing employee with Id = ' + CAST(@Id AS VARCHAR(10)) + ' is insert at ' + CAST(Getdate() AS VARCHAR(22)))  
END 
insert into EmployeeSalary values('Hi',25000,'Bangalore')
DELETE FROM EmployeeSalary WHERE Emp_ID = 6;  
select * from books

*/
CREATE TRIGGER tr
ON EmployeeSalary
AFTER INSERT
AS
  BEGIN
    insert into Employee_Audit_Test values('The insert successfully');
  END

insert into EmployeeSalary values('Bhaskar Dutta', 20000, 'Bangalore');

alter trigger tr1
on EmployeeSalary
after update
as 
begin
--insert into Employee_Audit_Test values('update successfully')
print 'successfully updated'
end
update EmployeeSalary set Emp_salary=25001 where Emp_ID=2;
----------------------------------------------------------------
--cursor
--1
DECLARE @EMP_ID INT;
DECLARE @EMP_NAME VARCHAR(MAX);
DECLARE @EMP_SALARY INT;
DECLARE @EMP_CITY NVARCHAR(MAX);

DECLARE EMP_CURSOR CURSOR
    LOCAL FORWARD_ONLY FOR
    SELECT * FROM EmployeeSalary;
OPEN EMP_CURSOR;
FETCH NEXT FROM EMP_CURSOR INTO @EMP_ID, @EMP_NAME, @EMP_SALARY, @EMP_CITY;

WHILE @@FETCH_STATUS = 0
BEGIN
    PRINT 'EMP_ID: ' + CONVERT(NVARCHAR(MAX), @EMP_ID) + '  EMP_NAME: ' + @EMP_NAME + '  EMP_SALARY: ' + CONVERT(NVARCHAR(MAX), @EMP_SALARY) + '  EMP_CITY: ' + @EMP_CITY;
	print '----------------------------------------------------------------------------------------'
    FETCH NEXT FROM EMP_CURSOR INTO @EMP_ID, @EMP_NAME, @EMP_SALARY, @EMP_CITY;
END;

CLOSE EMP_CURSOR;
DEALLOCATE EMP_CURSOR;

--2
--select * from books
declare @id int
declare @name varchar(50)
declare @price int

declare CursorE cursor scroll
For select BookId,BookName,price from books

open CursorE

fetch next from CursorE
into @id,@name,@price

while @@Fetch_Status=0
begin
	print  'Id: '+CAST(@id AS varchar(10))+', Name: '+@name+', price: '+CAST(@price AS varchar(10))
	print '============================================================================='
	/*select
		bookname
	from
		books
	where
		bookid=@id*/
fetch next from CursorE
into @id,@name,@price

end

close CursorE

deallocate CursorE

---3

declare
@EmpName varchar(50),
@OrderName varchar(50)

DECLARE CURSOREx1 CURSOR
FOR 
SELECT 
EmployeeSalary.Emp_Name, 
EmployeeOrder.Order_Name
FROM EmployeeSalary
LEFT JOIN EmployeeOrder
ON EmployeeSalary.Emp_ID=EmployeeOrder.Emp_ID;
open  CURSOREx1;
FETCH NEXT FROM CURSOREx1 INTO 
@EmpName, 
@OrderName;
WHILE @@FETCH_STATUS = 0
BEGIN
SELECT @OrderName = IIF(@OrderName IS NULL, 'No Food Ordered', @OrderName);
print '-------------------------------'
PRINT @EmpName + ' - ' + @OrderName;
FETCH NEXT FROM  CURSOREx1 INTO 
@EmpName, 
@OrderName;

END; 
CLOSE CURSOREx1; 
DEALLOCATE CURSOREx1;
--------------------------------------------------------

SELECT @@SPID AS 'ID', SYSTEM_USER AS 'Login Name', USER AS 'User Name'; 
