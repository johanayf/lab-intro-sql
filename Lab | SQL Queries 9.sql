##In this lab we will find the customers who were active in consecutive months of May and June. Follow the steps to complete the analysis.
##Create a table rentals_may to store the data from rental table with information for the month of May.
##Insert values in the table rentals_may using the table rental, filtering values only for the month of May.
Create table rental_may 
as select * from rental 
where month(rental_date) = 5 or month(return_date) = 5;
select * from rental_may;

##Create a table rentals_june to store the data from rental table with information for the month of June.
##Insert values in the table rentals_june using the table rental, filtering values only for the month of June.
Create table rental_june 
as select * from rental 
where month(rental_date) = 6 or month(return_date) = 6;
select * from rental_june;

##Check the number of rentals for each customer for May.
select c.first_name, c.last_name, count(r.rental_id) as number_of_rental
from rental_may as r
left join customer as c
on r.customer_id = c.customer_id
group by r.customer_id;

##Check the number of rentals for each customer for June.
select c.first_name, c.last_name, count(r.rental_id) as number_of_rental
from rental_june as r
left join customer as c
on r.customer_id = c.customer_id
group by r.customer_id;

