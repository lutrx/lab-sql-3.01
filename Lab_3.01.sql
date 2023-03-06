-- Lab 3.01

Use sakila;

-- 1. Drop column picture from staff.

SELECT * FROM sakila.staff;
ALTER TABLE sakila.staff
DROP COLUMN picture;

SELECT * FROM sakila.staff;

-- 2. A new person is hired to help Jon. Her name is TAMMY SANDERS, and she is a customer. Update the database accordingly.
SELECT * FROM sakila.customer
WHERE last_name = 'sanders' AND first_name = 'tammy';

INSERT INTO sakila.staff(first_name, last_name, address_id, active, store_id, username, email)
VALUES ('Tammy', 'Sanders', 79, 1, 2, 'Tammy', 'Tammy.Sanders@sakilastaff.com');

SELECT * FROM sakila.staff;

-- 3. Add rental for movie "Academy Dinosaur" by Charlotte Hunter from Mike Hillyer at Store 1. You can use current
-- date for the rental_date column in the rental table. Hint: Check the columns in the table rental and see what
-- information you would need to add there. You can query those pieces of information. For eg., you would notice
-- that you need customer_id information as well.

SELECT * FROM sakila.rental;

SELECT NOW();

SELECT * FROM sakila.film 
WHERE title = 'Academy Dinosaur';

SELECT * FROM sakila.customer
WHERE first_name = 'Charlotte' AND last_name = 'Hunter';

SELECT * FROM sakila.staff
WHERE first_name = 'Mike';

SELECT inventory_id 
FROM sakila.inventory 
JOIN sakila.film f using(film_id) 
WHERE f.title = 'Academy Dinosaur' AND store_id = 1;

-- Inserting rental fro movie Academy Dinosaur
INSERT INTO sakila.rental(rental_date, inventory_id, customer_id, staff_id)
VALUES ('2023-03-06 16:08:21', 1, 130, 1);

-- Checking the insert
SELECT * FROM sakila.rental
ORDER BY inventory_id ASC;