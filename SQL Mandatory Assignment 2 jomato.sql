--Dataset: Jomato
--About the dataset:
--You work for a data analytics company, and your client is a food delivery platform similar to
--Jomato. They have provided you with a dataset containing information about various
--restaurants in a city. Your task is to analyze this dataset using SQL queries to extract valuable
--insights and generate reports for your client.
--1. Create a user-defined functions to stuff the Chicken into �Quick Bites�. Eg: �Quick
--Chicken Bites�.
--maximum number of rating.
returns table
return 
Select RestaurantName, CuisinesType, Rating from jomato 
where rating=(Select max(rating) from jomato);
 
 select * from dbo.function_maxrate();

--3. Create a Rating Status column to display the rating as �Excellent� if it has more the 4
--start rating, �Good� if it has above 3.5 and below 5 star rating, �Average� if it is above 3
--and below 3.5 and �Bad� if it is below 3 star rating.
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
--5. Display the restaurant type and total average cost using rollup.