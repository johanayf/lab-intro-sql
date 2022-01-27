use sakila;
##List the number of films per category.
select c.name, count(f.film_id) as film_amount 
from film_category as f
left join category as c on f.category_id = c.category_id
group by f.category_id;

##Display the first and the last names, as well as the address, of each staff member.
select s.first_name, s.last_name, concat(a.address) as address
from staff as s
left join address as a on a.address_id = s.address_id;

##Display the total amount rung up by each staff member in August 2005.
select concat(s.first_name, ' ', s.last_name) as name, sum(p.amount) as total_amount
from payment as p
left join staff as s on s.staff_id = p.staff_id
where monthname(p.payment_date) = 'August' and 
year(p.payment_date) = 2005
group by p.staff_id;

use sakila;
##List all films and the number of actors who are listed for each film.
select f.title as film_name, 
count(a.actor_id) as number_of_actor
from film_actor as a
left join film as f on a.film_id = f.film_id
group by a.film_id;

##Using the payment and the customer tables as well as the JOIN command, list the total amount paid by each customer. List the customers alphabetically by their last names.
select c.last_name, c.first_name, sum(p.amount)
from payment as p 
left join customer as c
on p.customer_id = c.customer_id
group by p.customer_id
order by c.last_name;