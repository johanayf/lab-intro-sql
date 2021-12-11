use sakila;
select * from actor, film, customer; #Get all the data from tables actor, film and customer.
select title from film; #Get film titles.
select distinct name as language from language; #Get unique list of film languages under the alias language.
select count(store_id) from store; #5.1 Find out how many stores does the company have?
select count(staff_id) from staff #Find out how many employees staff does the company have?
select first_name from staff #Return a list of employee first names only?
