use Practice_SQL
-------------------------------------------------------------
CREATE TABLE Books(
    BookID int IDENTITY(1,1) NOT NULL,
    BookName varchar(50) ,
    Category varchar(50) NULL,
    Price numeric(18, 2) NULL,
    Price_Range varchar(20) NULL,
    PRIMARY KEY CLUSTERED ( BookID ASC )
) ON [PRIMARY]
go

INSERT INTO Books
    (BookName, Category, Price, Price_Range)
VALUES	
    ('Computer Architecture', 'Computers', 125.6, '100-150'),
    ('Advanced Composite Materials', 'Science', 172.56, '150-200'),
    ('Asp.Net 4 Blue Book', 'Programming', 56.00, '50-100'),
    ('Strategies Unplugged', 'Science', 99.99, '50-100'),
    ('Teaching Science', 'Science', 164.10, '150-200'),
    ('Challenging Times', 'Business', 150.70, '150-200'),
    ('Circuit Bending', 'Science', 112.00, '100-150'),
    ('Popular Science', 'Science', 210.40, '200-250'),
    ('ADOBE Premiere', 'Computers', 62.20, '50-100')
	
	select * from books;

	create table BookOrders(
Order_Id int IDENTITY(1,1) NOT NULL,
name varchar(50),
BookId int,
date varchar(50)
);
select * from BookOrders;
insert into BookOrders values('Souvik',1,'23-01-2023'),
							('Aishik',5,'03-01-2021'),
							('Asish',2,'02-05-2022'),
							('soham',4,'05-09-2022'),
							('Kriti',7,'09-01-2023'),
							('Abhishek',4,'01-02-2023'),
							('Debmalya',6,'03-12-2022'),
							('Disha',5,'01-11-2011'),
							('Ujjal',9,'04-02-2023');
---------------------------------------------------------------------
---function
SELECT 
    *
FROM 
    books where Price_Range='50-100';

create function BookPrice(@price float)
returns Table
AS
Return
select * from books where price=@price

select * from BookPrice(56)

create function BookName(@range varchar(50))
returns table
AS
Return select * from books where Price_Range=@range

select * from BookName('50-100')
--drop function BookName

select * from books where Price_Range='50-100'

create function BookAvgPrice()
returns float
AS
Begin
declare @avg float=0;
SELECT @avg =  AVG(price) FROM books
Return @avg
End
select dbo.BookAvgPrice()
------------------------------------------------------------------
--Procedure
alter PROCEDURE Booklist  
AS  
BEGIN  
    SELECT *
    FROM books 
    ORDER BY BookName;  
END;

EXEC Booklist; 
select * from Books
create procedure BookCategoryRange @name varchar(50)
as
select BookName,Price from Books where Category=@name

exec BookCategoryRange 'science'
-----------------------------------------------------------------------------
--index
CREATE INDEX idx_price_range
ON books (Price_Range);

drop index books.idx_price_range
--------------------------------------------------------------------------------------
--Left join,left join,inner join,full join
select books.BookName,books.Price,BookOrders.name,Books.BookID
from books left join BookOrders on books.BookID<>BookOrders.BookId
--inner join
select books.BookName,books.Price,BookOrders.name,Books.BookID
from books ,BookOrders where books.BookID<>BookOrders.BookId

-----------------------------------------------------------------
begin tran
update BookOrders set date='04-02-2022' where Order_Id=9
commit tran
-----------------------------------------------------------------
--view
create view MyBooks 
as
select BookID,BookName,Price from books where category='science'

select * from MyBooks
select trim(' hello ')