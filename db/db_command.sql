CREATE TABLE Persons (
PersonID int NOT NULL AUTO_INCREMENT, LastName varchar(255),
FirstName varchar(255), Address varchar(255), City varchar(255), PRIMARY KEY(PersonID)
);


ALTER TABLE Persons ADD Email varchar(255);

create table students(
	StudentID int not null auto_increment,
	Name varchar(255),
	Age int,
	Address varchar(255),
	primary key(StudentID)
);


create table Grades(
	StudentID int,
	Math int,
	English int,
	Science int
);

insert into students (Name, Age, Address) values('홍길동',30,'인천');
insert into students (Name, Age, Address) values('이연걸',60,'서울');
insert into students (Name, Age, Address) values('이몽룡',42,'대전');
insert into students (Name, Age, Address) values('성춘향',27,'경기');

insert into students (Name, Age, Address)
select '홍길동',30,'인천'
union all
select '이연걸',60,'서울'
union all
select '이몽룡',42,'대전'
union all
select '성춘향',27,'경기'

insert into Grades(StudentID, Math, English, Science) values(5,90,80,50);
insert into Grades(StudentID, Math, English, Science) values(6,69,76,65);
insert into Grades(StudentID, Math, English, Science) values(7,98,87,97);
insert into Grades(StudentID, Math, English, Science) values(8,87,67,79);

-- bulk insert
insert into Grades(StudentID, Math, English, Science) values(8,87,67,79),(8,87,67,79),(8,87,67,79),(8,87,67,79);


delete from Grades 

select *
from students s
inner join Grades g
on s.studentid = g.StudentID

select p.*
from Suppliers s
inner join Products p
on s.supplierID = p.supplierID
where lower(s.city) = 'tokyo';


select p.productname
from Categories c
inner join Products p
on c.CategoryID = p.CategoryID
where lower(c.categoryname) = 'seafood';

select s.Country, s.city, count(distinct p.productid) P_cnt, avg(p.price) avg_price
from Suppliers s
inner join Products p
on s.supplierID = p.supplierID
inner join Categories c
on c.CategoryID = p.CategoryID
group by s.Country, s.city;

select c.customerName, e.lastname, s.shippername, od.quantity
from orders o
inner join OrderDetails od
on o.orderid = od.orderid
inner join Customers c
on o.CustomerID = c.CustomerID
inner join Employees e
on o.EmployeeID = e.EmployeeID
inner join Shippers s
on o.ShipperID = s.ShipperID;


select s.*
from Suppliers s
inner join Products p
on s.SupplierID = p.SupplierID
inner join OrderDetails od 
on od.ProductID = p.ProductID
order by od.quantity desc
limit 3;

select cg.CategoryName, c.city
from orders o
inner join OrderDetails od
on o.orderid = od.orderid
inner join Customers c
on o.CustomerID = c.CustomerID
inner join Products p
on p.ProductId = od.productid
inner join categories cg
on cg.CategoryID = p.CategoryID
group by cg.CategoryName, c.city
order by sum(od.quantity)  desc ;


select p.ProductName
from orders o
inner join OrderDetails od
on o.orderid = od.orderid
inner join Customers c
on o.CustomerID = c.CustomerID
inner join Products p
on p.ProductId = od.productid
where lower(c.Country) = 'usa'
group by p.ProductName
order by sum(od.quantity) desc 