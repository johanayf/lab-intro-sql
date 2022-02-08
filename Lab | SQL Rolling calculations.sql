##Get number of monthly active customers.

##Active users in the previous month.

##Percentage change in the number of active customers.

##Retained customers every month.


use salika;
SELECT r.rental_id, r.rental_date, r.inventory_id, r.rental_date, f.film_id, f.title from rental as r
left join inventory as i on i.inventory_id = r.inventory_id 
left join film as f on f.film_id = i.film_id;