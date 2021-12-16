use sakila;

##select all the actors with the first name Scarlett
select * from ACTOR where FIRST_NAME = "Scarlett";

##Select all the actors with the last name ‘Johansson’.
select * from ACTOR where LAST_NAME = "Johansson";

##How many films (movies) are available for rent?
select count(distinct FILM_ID) from Inventory;

##How many films have been rented?
select count(distinct INVENTORY_ID) from Rental;

##What is the shortest and longest rental period?
select max(rental_duration) as Longest_rental_period, min(rental_duration) as Shortest_rental_period from film ;

##What are the shortest and longest movie duration? Name the values max_duration and min_duration.
select max(Length) as Longest_movie_duration, min(Length) as Shortest_movie_duration from film ;

##What's the average movie duration?
select avg(length) as movie_duration from film;

##What's the average movie duration expressed in format (hours, minutes)?
select floor(avg(length)/60) as hours, floor(avg(length)%60) as minutes from film;

##How many movies longer than 3 hours?
select count(film_id) from film where length > 180;

##Get the name and email formatted. Example: Mary SMITH - mary.smith@sakilacustomer.org.
select concat(first_name, " ", last_name, " ", "-", " ", email)from customer;

##What's the length of the longest film title?
select max(length(title)) from film;
