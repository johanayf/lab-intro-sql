use sakila;
##Rank films by length (filter out the rows that have nulls or 0s in length column). In your output, only select the columns title, length, and the rank.
select title,length, rank() over (order by length desc) as ranking 
from film 
where length is not null and length <> 0;

##Rank films by length within the rating category (filter out the rows that have nulls or 0s in length column). In your output, only select the columns title, length, rating and the rank.
select title, length, rating, rank() over (order by length desc) as ranking 
from film 
where length is not null and length <> 0 
order by rating;

##How many films are there for each of the categories in the category table. Use appropriate join to write this query
select c.name, count(f.film_id) as number_of_film
from film_category as f 
left join category as c 
on f.category_id = c.category_id
group by f.category_id;

##Which actor has appeared in the most films?
select a.first_name, a.last_name, 
##count(film_id) as number_of_film, -- to just if the actor has the most movies
rank() over(order by count(f.film_id) desc) as ranking
from film_actor as f
left join actor as a
on f.actor_id = a.actor_id
group by f.actor_id
limit 1;

##Question: I tried to use "having ranking = 1" but it didn't work. How to filter the ranking = 1?

##Most active customer (the customer that has rented the most number of films)
select c.first_name, c.last_name, count(r.rental_id), rank() over(order by count(r.rental_id) desc) as ranking
from rental as r
left join customer as c
on r.customer_id = c.customer_id
group by r.customer_ids
limit 1;

##Bonus: Which is the most rented film? The answer is Bucket Brotherhood This query might require using more than one join statement. Give it a try. We will talk about queries with multiple join statements later in the lessons.
select 
f.title, 
count(r.rental_id) as number_of_rental, 
rank() over(order by count(r.rental_id) desc) as ranking
from rental as r
left join inventory as i on r.inventory_id = i.inventory_id 
left join film as f on i.film_id = f.film_id
group by i.film_id
limit 1
;

