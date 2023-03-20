-- insert into Employee values(10,'Debmalya','yza@gmail.com','02/01/2023');
-- select * from Employee; 
--create view [Information] as select Emp_ID,Name,Email from Employee;
--SELECT * FROM [Information];
--SELECT @@SPID AS 'ID', SYSTEM_USER AS 'Login Name', USER AS 'User Name'; 
--ALTER TABLE Employee ADD Intern_ID int;
--update Employee SET Intern_ID = 11 WHERE Emp_ID = 2;
/*create table Details(
Intern_ID int not null primary key,
Full_Name varchar(30),
address varchar(20),
Age int
);*/
--select * from Details;
/*
insert into Details values(11,'Shohom Das','Kolkata',22);
insert into Details values(22,'Kriti Bhaskar','Kolkata',22);
insert into Details values(33,'Ashish Kashyap','Kolkata',22);
insert into Details values(44,'Ujjal Ghosh','Kolkata',22);
insert into Details values(55,'Souvik Mandal','Kolkata',22);
insert into Details values(66,'Abhishek Kumar','Kolkata',22);
insert into Details values(77,'Disha Chakroborty','Kolkata',22);
insert into Details values(88,'Debmalya Samanta','Kolkata',22);
insert into Details values(99,'Neha Singh','Kolkata',22);
insert into Details values(110,'Aishik Das','Kolkata',22);

update Details set address='Bihar' where Intern_ID=22
update Details set address='Nalanda' where Intern_ID=33
update Details set address='Bardwan' where Intern_ID=44
update Details set address='Bihar' where Intern_ID=66
update Details set address='Brasat' where Intern_ID=77
update Details set address='Metiabruj' where Intern_ID=88
update Details set address='Andul' where Intern_ID=99
update Details set address='DumDum Airport' where Intern_ID=110
*/
--Inner Join
/*
SELECT Employee.Emp_ID, Details.Full_Name,Details.address
FROM Employee
INNER JOIN Details ON Employee.Intern_ID = Details.Intern_ID;
*/
--Left Join
/*
SELECT Details.Full_Name, Employee.Emp_ID
FROM Details
LEFT JOIN Employee ON Employee.Intern_ID = Details.Intern_ID
ORDER BY Details.Full_Name;
*/
--Right Join
/*SELECT Employee.Emp_ID, Details.Full_Name
FROM Employee
RIGHT JOIN Details ON Employee.Intern_ID = Details.Intern_ID
ORDER BY Employee.Emp_ID;
*/
