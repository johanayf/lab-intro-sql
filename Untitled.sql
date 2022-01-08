use bank;
select A2 as district_name, A11 as average_salary from district
where A11>10000;

select * from loan where status="B";
select * from loan where status in ('B');

select * from card where type = "junior" limit 10;

##2.03 Activity 1 
##Get card_id and year_issued for all gold cards.
select card_id, issued from card where type = "gold";

##When was the first gold card issued? (Year)--Version 1
select card_id, 
extract(YEAR FROM convert(substring_index(issued, " " ,1), date)) 
from card 
where type = "gold" 
order by issued
limit 1;

##When was the first gold card issued? (Year) --2
select card_id, 
date_format(convert(substring_index(issued, " " ,1), date), "%Y")
from card 
where type = "gold" 
order by issued
limit 1;


##Get issue date as: 
##date_issued: 'November 7th, 1993'
SELECT 
    DATE_FORMAT(CONVERT( SUBSTRING_INDEX(issued, ' ', 1) , DATE),'%M %D, %Y')
FROM
    card;

##fecha_emision: '07 of November of 1993'
select date_format(convert(substring_index(issued, " " ,1), date), "%d of %M of %Y") from card;

#Check for transactions with null or empty values for the column amount.
select * from trans where amount = " " or ""
