## Lecture 13 

##Month on MOnth # of active users

create or replace view user_activities as 
select account_id, convert(date, date) as Activity_date, 
date_format(convert(date, date), '%m') as Activity_month,
date_format(convert(date, date), '%Y') as Activity_year
from bank.trans;

select * from user_activities;

create or replace view Monthly_active_user as 
select count(distinct account_id) as active_users,
Activity_month, Activity_year
from user_activities
group by 3,2  
order by 3,2;

select * from Monthly_active_user;

with cte_activity as (select active_users, 
lag(active_users, 1) over (partition by Activity_year) as last_month,
Activity_year, Activity_month 
from Monthly_active_user) 
select * from cte_activity 
where last_month is not null;

##Syntax Lag() function:


#number of retained customers/users per month
create or replace view retained_customers_view as
with distinct_users as (select distinct account_id, Activity_month, Activity_year from user_activities)
select count(distinct d1.account_id) as Retained_customers, d1.Activity_month, 
d1.Activity_year from distinct_users d1
join distinct_users d2
on d1.account_id = d2.account_id
and d1.activity_month = d2.activity_month + 1
group by d1.Activity_month, d1.Activity_year
order by d1.Activity_month, d1.Activity_year;

select * from distinct_users;

select * from retained_customers_view;

select retained_customers,(Retained_customers-lag(Retained_customers, 1) over(partition by Activity_year)) as Diff, Activity_month, Activity_year
from retained_customers_view;

with upd as (select retained_customers,(Retained_customers-lag(Retained_customers, 1) over(partition by Activity_year)) as Diff, Activity_month, Activity_year
from retained_customers_view
)
select retained_customers, Diff*100/lag(Retained_customers, 1)  over(partition by Activity_year) as Diff_percentage,
 Activity_month, Activity_year
from upd;

