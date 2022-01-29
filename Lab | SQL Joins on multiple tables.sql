use sakila;
##Write a query to display for each store its store ID, city, and country.
select s.store_id, c1.city, c2.country
from store as s
left join address as a on s.address_id = a.address_id
left join city as c1 on a.city_id = c1.city_id
left join country as c2 on c1.country_id = c2.country_id;

##Write a query to display how much business, in dollars, each store brought in.
select s.store_id, sum(p.amount) as total_amount_revenue
from payment as p
right join staff on staff.staff_id = p.staff_id
right join store as s on s.store_id = staff.store_id
group by s.store_id;

##What is the average running time of films by category?
select c.name as cateogry, avg(length) as avg_running_time 
from film as f 
right join film_category as f2 on f.film_id = f2.film_id
right join category as c on c.category_id = f2.category_id 
group by c.category_id;

##Which film categories are longest?
select c.name as category
from film as f 
right join film_category as f2 on f.film_id = f2.film_id
right join category as c on c.category_id = f2.category_id 
group by c.category_id
order by sum(length) desc
limit 1;

##Display the most frequently rented movies in descending order.
select f.title as film, count(r.rental_id) as num_rental
from rental as r 
right join inventory as i on r.inventory_id = i.inventory_id
right join film as f on f.film_id = i.film_id
group by f.film_id
order by num_rental desc;

##List the top five genres in gross revenue in descending order.
select c.name as cateogry, sum(p.amount) as total_amount_revenue 
from payment as p
right join rental as r on r.rental_id = p.rental_id
right join inventory as i on r.inventory_id = i.inventory_id
right join film as f on f.film_id = i.film_id
right join film_category as f2 on f.film_id = f2.film_id
right join category as c on c.category_id = f2.category_id 
group by c.category_id
order by total_amount_revenue desc
limit 5;

##Is "Academy Dinosaur" available for rent from Store 1?
select if (count(inventory_id)>0, 'Yes', 'No') as 'Is "Academy Dinosaur" available for rent from Store 1'
from inventory as i 
right join film as f 
on i.film_id = f.film_id
where f.title = 'Academy Dinosaur' and store_id = 1;