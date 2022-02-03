##How many copies of the film Hunchback Impossible exist in the inventory system?
select title as film, (select count(inventory_id) 
from inventory 
where film_id in 
(select film_id from film 
where title = 'Hunchback Impossible')) as number_of_copies
from film 
where title = 'Hunchback Impossible';

##List all films whose length is longer than the average of all the films.
select title from film 
where length(title) > (select avg(length(title)) from film);

##Use subqueries to display all actors who appear in the film Alone Trip.
##from join
select concat (a.first_name, ' ', a.last_name) as actor, f.title as film
from film_actor as fa
left join actor as a on a.actor_id = fa.actor_id
left join film as f on fa.film_id = f.film_id
where f.title = 'Alone Trip'
;

##use subqueries and join
select concat (first_name, ' ', last_name) as actor, 
(select title from film where title = 'Alone Trip' ) as title
from actor 
where actor_id in (
select actor_id from film_actor 
where film_id in (select film_id from film 
where title = 'Alone Trip'));



##Sales have been lagging among young families, and you wish to target all family movies for a promotion. Identify all movies categorized as family films.
select title from film
where film_id in
(select film_id from film_category 
where category_id in 
(select category_id from category 
where name = 'family')); 

##Get name and email from customers from Canada using subqueries. Do the same with joins. Note that to create a join, you will have to identify the correct tables with their primary keys and foreign keys, that will help you get the relevant information.
##Using subquieries
select concat(first_name, ' ', last_name) as name, email 
from customer
where address_id in 
(select address_id from address 
where city_id in 
(select city_id from city 
where country_id in 
(select country_id from country 
where country = 'Canada')));

##Using joins
select concat(c.first_name, ' ', c.last_name) as name, c.email 
from customer as c
left join address as a on a.address_id = c.address_id
left join city as c1 on c1.city_id = a.city_id
left join country as c2 on c1.country_id = c2.country_id 
where c2.country = 'Canada';

##Which are films starred by the most prolific actor? Most prolific actor is defined as the actor that has acted in the most number of films. First you will have to find the most prolific actor and then use that actor_id to find the different films that he/she starred.
select title from film where 
film_id in (select film_id from film_actor
where actor_id in (
select actor_id from 
(select actor_id, count(film_id) as num 
from film_actor 
group by actor_id 
order by num desc limit 1) fa));

##Films rented by most profitable customer. You can use the customer table and payment table to find the most profitable customer ie the customer that has made the largest sum of payments
select concat(first_name, ' ', last_name) as name from customer
where customer_id in 
(select customer_id from 
(select customer_id, sum(amount) as total_amount 
from payment
group by customer_id 
order by total_amount desc limit 1) p);

select title from film where film_id in 
(select distinct film_id from inventory 
where inventory_id in 
	(select inventory_id from rental 
	where customer_id = (
		select customer_id from 
			(select customer_id, sum(amount) as total_amount 
				from payment
				group by customer_id 
				order by total_amount desc limit 1) p)));


##Get the client_id and the total_amount_spent of those clients who spent more than the average of the total_amount spent by each client.
select customer_id, sum(amount) as total_spent from payment 
group by customer_id
having total_spent > 
(select avg(spent) as avg_spent from 
(select sum(amount) as spent from payment 
group by customer_id) p )
 ;

