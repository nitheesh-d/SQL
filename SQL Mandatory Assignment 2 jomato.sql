--Dataset: Jomato
--About the dataset:
--You work for a data analytics company, and your client is a food delivery platform similar to
--Jomato. They have provided you with a dataset containing information about various
--restaurants in a city. Your task is to analyze this dataset using SQL queries to extract valuable
--insights and generate reports for your client.select * from jomato;
--1. Create a user-defined functions to stuff the Chicken into ‘Quick Bites’. Eg: ‘Quick
--Chicken Bites’.create function QuickChickenBites (@id int) returns tableasreturn (select stuff ('Quick Bites',6,1,'Chicken') as QuickBitesfrom jomato where orderId=@id);  select * from QuickChickenBites (4); --2. Use the function to display the restaurant name and cuisine type which has the
--maximum number of rating.create function function_maxrate()
returns table
return 
Select RestaurantName, CuisinesType, Rating from jomato 
where rating=(Select max(rating) from jomato);
 
 select * from dbo.function_maxrate();

--3. Create a Rating Status column to display the rating as ‘Excellent’ if it has more the 4
--start rating, ‘Good’ if it has above 3.5 and below 5 star rating, ‘Average’ if it is above 3
--and below 3.5 and ‘Bad’ if it is below 3 star rating.
select *,
case 
when Rating>4 then 'Excellent'
when Rating between 3.5 and 4 then 'Good'
when Rating between 3 and 3.5 then 'Average'
else 'Bad'
end
as ratingss  
from jomato;

--4. Find the Ceil, floor and absolute values of the rating column and display the current date
--and separately display the year, month_name and day.
select Ceiling(Rating) as ceil_rate,
floor (Rating) as floor_rate, 
abs(Rating) as abs_rate,
getdate()as [current date]
from jomato;

 select year(getdate ()) as year, month (getdate()) as month_name,day(getdate())as day from jomato;

 select * from jomato;
--5. Display the restaurant type and total average cost using rollup.select Restauranttype,sum(averageCost) as avgcost from jomatogroup by rollup (Restauranttype,averageCost);