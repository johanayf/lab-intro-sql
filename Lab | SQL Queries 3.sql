use sakila;
##How many distinct (different) actors' last names are there?
select count(distinct last_name) as Amount_Last_Name from actor; 

##In how many different languages where the films originally produced? (Use the column language_id from the film table)
select count(distinct language_id) from film;

##How many movies were released with "PG-13" rating?
select count(film_id) from film where rating = 'PG-13';

##Get 10 the longest movies from 2006.
select title from film order by length desc limit 10;

##How many days has been the company operating (check DATEDIFF() function)?
select datediff(max(rental_date), min(rental_date)) from rental;

##Show rental info with additional columns month and weekday. Get 20.
select rental_date, MONTH(rental_date), weekday(rental_date) from rental limit 20;

##Add an additional column day_type with values 'weekend' and 'workday' depending on the rental day of the week.
select rental_date, 
case when month(rental_date) < 6 then 'Weekday'
else 'Weekend'
end as day_type
from rental;

##1 How many rentals were in the last month of activity? 
select count(rental_id) from rental 
where year(rental_date) = (select year(max(rental_date)) from rental) 
and month(rental_date) = (select month(max(rental_date)) from rental);

##2 How many rentals were in the last month of activity? 
SELECT count(rental_id) 
from 
rental 
where 
rental_date >= DATE_ADD((select max(rental_date) from rental), INTERVAL -1 MONTH);