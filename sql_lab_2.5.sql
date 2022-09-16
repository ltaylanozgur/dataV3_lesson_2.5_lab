USE sakila; -- Sakila database.

-- 1. Select all the actors with the first name ‘Scarlett’.
SELECT * FROM sakila.actor 
WHERE first_name = 'Scarlett';


-- 2. How many films (movies) are available for rent and how many films have been rented?
SELECT COUNT(*) AS 'number of available films' FROM sakila.rental
WHERE NOT return_date LIKE ' '; 



-- 3. What are the shortest and longest movie duration? 
-- Name the values max_duration and min_duration.
SELECT min(length) as min_duration, max(length) as max_duration 
FROM sakila.film;


-- 4. What's the average movie duration expressed in format (hours, minutes)?
SELECT CONCAT(LEFT(AVG(length)/60,1), ':' ,ROUND(AVG(length) % 60)) AS avg_movie_duration
FROM film; -- after conversion

-- 5. How many distinct (different) actors' last names are there?
SELECT COUNT(DISTINCT last_name) 
FROM sakila.actor;


-- 6. Since how many days has the company been operating (check DATEDIFF() function)?
SELECT DATEDIFF(MAX(payment_date), MIN(payment_date)) 
FROM sakila.payment;


-- 7. Show rental info with additional columns month and weekday. Get 20 results.
SELECT *, month(CONVERT(rental_date, DATE)) AS month, weekday(convert(rental_date, DATE)) AS weekday
FROM sakila.rental
LIMIT 20;


-- 8. Add an additional column day_type with values 'weekend' and 'workday' 
-- depending on the rental day of the week.
SELECT *,
CASE
WHEN weekday(rental_date) = 5 OR weekday(rental_date) = 6 THEN 'weekend'
ELSE 'workday'
END AS 'day_type'
FROM sakila.rental; 


-- 9. Get release years.
SELECT title, release_year FROM sakila.film; -- I just wanted to display the film titles as well.
SELECT DISTINCT release_year FROM sakila.film; -- unique value


-- 10. Get all films with ARMAGEDDON in the title.
SELECT * FROM sakila.film  WHERE title LIKE 'ARMAGEDDON%'; -- films that start with ARMAGEDDON
SELECT * FROM sakila.film  WHERE title LIKE '%ARMAGEDDON%'; -- THE ANSWER: films that consist of ARMAGEDDON


-- 11. Get all films which title ends with APOLLO.
SELECT * FROM sakila.film WHERE title LIKE '%APOLLO';


-- 12. Get 10 the longest films.
SELECT * FROM sakila.film
ORDER BY length DESC
LIMIT 10;


-- 13. How many films include Behind the Scenes content?
SELECT COUNT(*) FROM sakila.film WHERE special_features like 'Behind the Scenes';


