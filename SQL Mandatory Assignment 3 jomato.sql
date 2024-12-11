--Dataset: Jomato
--About the dataset:
--You work for a data analytics company, and your client is a food delivery platform similar to
--Jomato. They have provided you with a dataset containing information about various
--restaurants in a city. Your task is to analyze this dataset using SQL queries to extract valuable
--insights and generate reports for your client.
--Tasks to be performed:
 select * from jomato;
--1. Create a stored procedure to display the restaurant name, type and cuisine where the
--table booking is not zero.
create procedure proc_jomato
as select RestaurantName,RestaurantType,CuisinesType from jomato
where TableBooking<>0;

exec proc_jomato;

--2. Create a transaction and update the cuisine type ‘Cafe’ to ‘Cafeteria’. Check the result
--and rollback it. 
begin transaction 
update jomato set CuisinesType='Cafeteria' where CuisinesType ='cafe' ;
select * from jomato;
rollback transaction;

--3. Generate a row number column and find the top 5 areas with the highest rating of
--restaurants.
select top 5 rating,Area, ROW_NUMBER() over 
( order by rating desc ) as row_numbers from jomato;

--4. Use the while loop to display the 1 to 50.
declare @loop int=1
while @loop <=50
begin 
print @loop
set @loop=@loop+1
end;


--5. Write a query to Create a Top rating view to store the generated top 5 highest rating of
--restaurants.
create view top_view
as
select top 5 RestaurantName, rating from jomato
order by Rating desc;

select * from top_view;


--6. Write a trigger that sends an email notification to the restaurant owner whenever a new
--record is inserted.
CREATE TRIGGER trgAfterInsert
ON Jomato
AFTER INSERT
AS
BEGIN
    print('New Data Inserted')
END;