use sakila;

##back up the table
create table backup_staff as
select * from staff;

##Drop column picture from staff.
alter table backup_staff 
drop column picture;

##A new person is hired to help Jon. Her name is TAMMY SANDERS, and she is a customer. Update the database accordingly.
select * from customer where first_name = 'Tammy' and last_name = 'Sanders';
insert into backup_staff (staff_id, first_name, last_name, address_id, email, store_id, active, username, password, last_update) 
values ('3', 'TAMMY', 'SANDERS', '79', 'TAMMY.SANDERS@sakilacustomer.org', '2', '1', 'Tammy', '', '2006-02-15 03:57:16');

select * from backup_staff;

##Add rental for movie "Academy Dinosaur" by Charlotte Hunter from Mike Hillyer at Store 1. 
##what information does rental table store? 
select * from rental where customer_id = "130" and staff_id = '1';
select * from INFORMATION_SCHEMA.COLUMNS
where table_name = 'rental';
##where column_name = 'rental_id';


insert into rental ('rental_id','rental_date', 'inventory_id', 'customer_id','return_date', 'staff_id', 'last_update')
values ('', '', '', '130', '', '1', '');

select * from sakila.customer
where first_name = 'CHARLOTTE' and last_name = 'HUNTER';

##Find out film_id for the movie:
select * from film 
where title = 'Academy Dinosaur';

##Find out inventory id from film_ID
select * from inventory
where film_id = '1' and store_id = '1';

select * from payment
where customer_id = '130' ;

#Delete non-active users, but first, create a backup table deleted_users to store customer_id, email, and the date for the users that would be deleted. Follow these steps:
select * from delete_users;

#Check if there are any non-active users
select * from customer where active = '0';

#Create a table backup table as suggested
#Insert the non active users in the table backup table
create table delete_users as
select * from customer where active = '0';
select * from delete_users;
#Delete the non active users from the table customer
delete from customer where active = '0';