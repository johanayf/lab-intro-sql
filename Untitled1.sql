use bank;
select k_symbol from 
(select avg(amount) as Average, k_symbol from bank.order
where k_symbol <> ''
group by k_symbol
having Average>3000
order by Average desc) sub2;

##CTEs
with cte_loan as (select * from bank.loan)
select * from cte_loan where status = 'B';

with cte_transactions as (
select account_id, sum(account) as total_a, sum(balance) as total_b
from bank.trans
group by account_id)
select * from cte_transactions ct join bank.account a 
on a.account_id = ct.account_id;

##views
create view customers_status_D as (
select * from loan where status = 'D')
with check option;
select * from customers_status_D;


insert into customers_status_D values(0000, 00000, 987398, 00000, 60, 00000, 'C');

drop view if exists customers_status_c;

##correlated subqueries
select * from bank.loan
where amount > (select avg(amount) from bank.loan)
order by amount desc
limit 10;

select * from loan;

select * from bank.loan l1
where amount > (select avg(amount) from bank.loan l2
where l1.status = l2.status)
order by amount desc;

