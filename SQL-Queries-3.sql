use sakila;

#1.How many distinct (different) actors' last names are there?
select count(distinct(last_name)) from actor;

#2.In how many different languages where the films originally produced? (Use the column language_id from the film table)?
select count(distinct(language_id)) from film;

#3.How many movies were released with "PG-13" rating?
select count(film_id) from film where rating = "PG-13";

#4.Get 10 the longest movies from 2006.
select * from film where release_year = "2006" order by length desc limit 10;

#5.How many days has been the company operating (check DATEDIFF() function)?
select datediff(max(rental_date), min(return_date)) as datediff from rental;

#6.Show rental info with additional columns month and weekday. Get 20.
select *, month(rental_date), weekday(rental_date), dayname(rental_date) from rental limit 20;

#7.Add an additional column day_type with values 'weekend' and 'workday' depending on the rental day of the week.
select *, month(rental_date), weekday(rental_date),
case
when weekday(rental_date) < 5 then "weekday"
else "weekend"
end as day_type
from rental;

#8.How many rentals were in the last month of activity?
select count(rental_id) from rental where rental_date > (select max(rental_date) - interval 1 month from rental) ;


