##Get film ratings
use sakila;
select title, rating from film;

##Get release years
select title, release_year from film;

##Get all films with Armageddon in the tile
select title from film 
where title like '%ARMAGEDDON%';

##Get all films with APOLLO in the title
select title from film 
where title like '%APOLLO%';

##Get all films which title ends with APOLLO.
select title from film 
where title like '%APOLLO';

##Get all films with word DATE in the title.
select title from film 
where title like '%DATE%';

##Get 10 films with the longest title.
select title from film 
order by length(title) desc
limit 10;

##Get 10 the longest films.
select title from film 
order by length desc 
limit 10;

##How many films include Behind the Scenes content?
select title from film
where special_features like '%Behind the Scenes%';

##List films ordered by release year and title in alphabetical order.
select title from film 
order by release_year, title;

