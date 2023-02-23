#LAB 3 SQL

USE sakila;

#1. How many distinct (different) actors' last names are there?
SELECT 
COUNT(DISTINCT last_name) 
FROM actor;

#2. In how many different languages where the films originally produced? (Use the column language_id from the film table)
SELECT 
COUNT(DISTINCT language_id)
FROM language;

#3. How many movies were released with "PG-13" rating?
SELECT 
COUNT(DISTINCT film_id) 
FROM film 
WHERE rating = "PG-13";

#4. Get 10 the longest movies from 2006.
SELECT *
FROM film
WHERE release_year = 2006
ORDER BY length DESC
LIMIT 10;

#5. How many days has been the company operating (check DATEDIFF() function)?
SELECT 
DATEDIFF(max(rental_date), min(rental_date))
FROM rental;

#6. Show rental info with additional columns month and weekday. Get 20.
SELECT 
rental_id, rental_date, MONTH(rental_date) AS rental_month, 
DAYNAME(rental_date) AS rental_weekday 
FROM rental 
LIMIT 20;

#7. Add an additional column day_type with values 'weekend' and 'workday' depending on the rental day of the week.
SELECT rental_id, rental_date,
CASE
WHEN DAYOFWEEK(rental_date) IN (1,7) THEN "weekend"
ELSE "workday"
END AS day_type
FROM rental;

#8. How many rentals were in the last month of activity?
SELECT max(rental_date)
FROM rental;

SELECT COUNT(rental_id)
FROM rental
WHERE rental_date >= "2006-02-01";