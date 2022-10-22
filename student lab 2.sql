-- lab student portal 2.05
-- lab lesson 2.02:
-- 1. Select all the actors with the first name ‘Scarlett’.
select * from sakila.actor
where first_name = "Scarlett";
-- 2. Select all the actors with the last name ‘Johansson’.
select * from sakila.actor
where last_name = "Johansson";
-- 3.How many films (movies) are available for rent?
select count(inventory_id) from rental;
-- 4.How many films have been rented?
select max(rental_id) from rental;
-- 5. What is the shortest and longest rental period?
select min(rental_duration) from film;
select min(rental_duration) from film;
-- 6.What are the shortest and longest movie duration? Name the values max_duration and min_duration.
select min(length) as min_duration from film;
select max(length) as max_duration from film;
-- 7.What's the average movie duration?
select avg(length) as duration from film;
-- 8.What's the average movie duration expressed in format (hours, minutes)?
select data_format(avg(length,'%H,%i')) from film;
-- 9.How many movies are longer than 3 hours?
select * from film
where length >180;
-- 10.Get the name and email formatted. Example: Mary SMITH - mary.smith@sakilacustomer.org.
-- 11. What's the length of the longest film title?
select max(length(title)) from film;

-- lab lesson 2.03:
-- 1. How many distinct (different) actors' last names are there?
select count(distinct last_name) from actor;
-- 2. In how many different languages where the films originally produced? (Use the column language_id from the film table)
select count(distinct language_id)
from film;
-- 3. How many movies were released with "PG-13" rating?
select count(*)
from film
where rating = "PG-13";
-- 4.Get 10 the longest movies from 2006.
select title, length
from film
where release_year = 2006
order by length desc
limit 10;
-- 5.How many days has been the company operating (check DATEDIFF() function)?
select datediff(max(rental_date), min(rental_date)) as active_days
from rental;
-- 6. Show rental info with additional columns month and weekday. Get 20.
select *, date_format(rental_date, '%M') as month , date_format(rental_date, '%W') as weekday
from rental
limit 20;
-- 7. Add an additional column day_type with values 'weekend' and 'workday' depending on the rental day of the week.
select *, case when date_format(rental_date, '%W') in ('Saturday', 'Sunday')
          then 'weekend'
          else 'workday' end as day_type
from rental;
-- 8.How many rentals were in the last month of activity?
select date(max(rental_date))- INTERVAL 30 DAY, date(max(rental_date))
from rental;
select count(*)
from rental
where date(rental_date) between date('2006-01-15') and date('2006-02-14')
