#query01
use v_art;
insert into artist values (default,"Johaness",default,"Vermeer",1632,1674,"Netherlands","n");

#query02
select fname as "First Name", mname as "Middle Name", lname as "Last Name", dob as "Date of Birth", dod as "Date of Death", country as "Country", local as "Local" from artist order by lname;

#query03
update artist set dod = 1675 where lname = "Vermeer";

#query04
delete from artist where lname = "Vermeer";

#query05
SELECT first_name, last_name, phone FROM customer where city = 'Houston';

#query06
select product_name, list_price, (list_price - 500) as 'Discount Price' from product where list_price >= 5000 order by list_price desc;

#query07
select first_name, last_name, email from staff where store_id <> 1 order by first_name;

#query08
select product_name, model_year, list_price from product where product_name like '%spider%';

#query09
select product_name, list_price from product where list_price between 500 and 550 order by list_price;

#query10
#Just one observation, if I follow all the conditions listed with and 'and' from the first to the second condition, the result will list just 3 lines. I need to change to 'or' to list the five records.
#And the first condition limits the result to not null phone numbers, contrary to the printscreen about the desired result.
select first_name, last_name, phone, street, city, state, zip_code from customer where phone is not null or city like '%ach|och%' or last_name = 'William' limit 5;

#query11
SELECT TRIM('- 2016' FROM product_name) AS 'Product Name without Year' FROM product ORDER BY product_id ASC LIMIT 14;

#query12
select product_name, CONCAT('$', FORMAT((list_price / 3), 2)) as 'One of 3 payments' from product where product_name like '%2019';

#query13
use magazine;
select magazineName, ROUND(magazinePrice - (magazinePrice * 0.03), 2) as '3%  Off' from magazine;

#query14
select subscriberKey, round(datediff('2020-12-20', subscriptionStartDate) / 365 ,0) as 'Year since subscription' from subscription;

#query15
select subscriptionStartDate, subscriptionLengTH, date_format(date_add(subscriptionStartDate, interval subscriptionLengtH MONTH), "%M %e, %Y") as 'Subscription end' from subscription;