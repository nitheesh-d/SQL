create database assignment;

CREATE TABLE Salesman (
    SalesmanId INT,
    Name VARCHAR(255),
    Commission DECIMAL(10, 2),
    City VARCHAR(255),
    Age INT
);
INSERT INTO Salesman (SalesmanId, Name, Commission, City, Age)
VALUES
    (101, 'Joe', 50, 'California', 17),
    (102, 'Simon', 75, 'Texas', 25),
    (103, 'Jessie', 105, 'Florida', 35),
    (104, 'Danny', 100, 'Texas', 22),
    (105, 'Lia', 65, 'New Jersey', 30);

	CREATE TABLE Customer (
    SalesmanId INT,
    CustomerId INT,
   
    PurchaseAmount INT,
    );
	INSERT INTO Customer (SalesmanId, CustomerId, CustomerName, PurchaseAmount)
VALUES
    (101, 2345, 'Andrew', 550),
    (103, 1575, 'Lucky', 4500),
    (104, 2345, 'Andrew', 4000),
    (107, 3747, 'Remona', 2700),
    (110, 4004, 'Julia', 4545);

	CREATE TABLE Orders (OrderId int, CustomerId int, SalesmanId int, Orderdate Date, Amount money)
	INSERT INTO Orders Values 
(5001,2345,101,'2021-07-01',550),
(5003,1234,105,'2022-02-15',1500)

select * from Salesman
select * from Customer
select * from Orders

--1. Insert a new record in your Orders table.insert into Orders values (5005,3747,107, '2023-03-16',1200)
--2. Add Primary key constraint for SalesmanId column in Salesman table. Add default
--constraint for City column in Salesman table. Add Foreign key constraint for SalesmanId
--column in Customer table. Add not null constraint in Customer_name column for the
--Customer table.
 alter table Salesman
 alter column SalesmanId int not null;
 alter table Salesman add constraint pk_SalesmanId primary key (SalesmanId)
  alter table Salesman add constraint df_city default 'df_city' for city;
  alter table Customer with nocheck add foreign key (SalesmanId) references Salesman (SalesmanId);
 alter table Customer 
 alter column  CustomerName VARCHAR(255) not null;

 --3. Fetch the data where the Customer’s name is ending with either ‘N’ also get the
--purchase amount value greater than 500.
 select * from Customer where CustomerName like '%N';
  select * from Customer where PurchaseAmount> 500;

  select * from Salesman
select * from Customer
select * from Orders

  --4. Using SET operators, retrieve the first result with unique SalesmanId values from two
--tables, and the other result containing SalesmanId without duplicates from two tables.select SalesmanId from Salesmanunionselect SalesmanId from Customer order by SalesmanId;select SalesmanId from Salesmanunion allselect SalesmanId from Customer order by SalesmanId;--5. Display the below columns which has the matching data.
--Orderdate, Salesman Name, Customer Name, Commission, and City which has the
--range of Purchase Amount between 500 to 1500
select Orderdate, Name, CustomerName,PurchaseAmount, Commission, City from Salesman
inner join Customer on
Salesman.SalesmanId=Customer.SalesmanId
inner join Orders on 
orders.SalesmanId=Customer.SalesmanId
where PurchaseAmount between 500 and 1500;

--6. Using right join fetch all the results from Salesman and Orders table.select * from Salesman as s right join Orders as o on s.SalesmanId=o.SalesmanId;