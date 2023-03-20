create table Customers(
customer_id int not null primary key,
first_name char(10)
);

insert into Customers values(1,'Souvik');
insert into Customers values(2,'Soham');
insert into Customers values(3,'Debmaya');
insert into Customers values(4,'Ashish');
insert into Customers values(5,'Aishik');

select * from Customers;

create table Orders(
order_id int not null primary key,
amount int,
customer int not null 
);

insert into Orders values(1,200,10);
insert into Orders values(2,500,3);
insert into Orders values(3,300,6);
insert into Orders values(4,800,5);
insert into Orders values(5,150,8);

select * from Orders;
--Full Outer Join
SELECT customer_id,first_name,amount
FROM Customers
FULL OUTER JOIN Orders
ON Customers.customer_id = Orders.customer;
/*
create index indexName on Orders(amount);
drop index indexName on Orders
*/

Create function Fun_EmployeeInformation()
returns table
as
return(select * from Orders  )
select * from Fun_EmployeeInformation()

create function fun_PrintNumber2()
returns varchar
as
begin
    return 'Hi'
end
drop function 
print dbo.fun_PrintNumber2()



--Procedure
create procedure  ProcN @amount int,@customer int
as
select * from Orders where amount=@amount and customer>@customer;

go;

exec ProcName @amount=200, @customer=3










