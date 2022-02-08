##List each pair of actors that have worked together.
with cte_actor as (
select a.actor_id, 
concat(a.first_name, ' ', a.last_name) as name, 
f.title as film, 
fa.film_id as film_id

from film_actor as fa

left join actor as a on a.actor_id = fa.actor_id
left join film  as f on f.film_id = fa.film_id) 

select distinct cte1.name, cte2.name from cte_actor as cte1
cross join cte_actor as cte2

where cte1.film_id = cte2.film_id
and cte1.actor_id > cte2.actor_id
;

##For each film, list actor that has acted in more films.
with cte as (select a.actor_id as actor_id, 
concat(a.first_name, ' ', a.last_name) as name 
from film_actor as fa
left join actor as a 
on a.actor_id = fa.actor_id
group by fa.actor_id 
having count(fa.actor_id)>1)

select cte.name as name, f.title as film
from film_actor as fa 
inner join cte
on cte.actor_id = fa.actor_id
left join film as f
on fa.film_id = f.film_id;
