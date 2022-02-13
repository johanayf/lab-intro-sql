use sakila;
#Create View
create view monthly_customer as
select date_format(rental_date, '%M') as month, 
date_format(rental_date, '%Y') as year, count(distinct customer_id) as active_customer
from rental
group by date_format(rental_date, '%M') , 
date_format(rental_date, '%Y')
order by year;

##Get number of monthly active customers.
select * from monthly_customer;

##Active users in the previous month.
select *,
lag(active_customer, 1) over() as lastmonth_customer
from monthly_customer
;

##Percentage change in the number of active customers.
select month, year, ((active_customer - lag(active_customer, 1) over())/active_customer*100) as lastmonth_percentage
from monthly_customer;
select * from monthly_customer;

##Retained customers every month.
with monthly_customer as (select distinct customer_id as active_customer, date_format(rental_date, '%M') as month,
date_format(rental_date, '%Y') as year
from rental)
select m.month, m.year, count(distinct m.active_customer), (lag(m.month, 1) over()) as second_month from monthly_customer as m
cross join monthly_customer as m2 
where m.active_customer = m2.active_customer 
group by m.month, m.year
order by m.year;
