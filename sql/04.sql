/*
 * List the first and last names of all actors who:
 * 1. have appeared in at least one movie in the "Children" category,
 * 2. but that have never appeared in any movie in the "Horror" category.
 */

WITH yes_children AS (
	SELECT actor_id
    FROM film f
    JOIN film_actor fa USING (film_id)
    JOIN film_category fc USING (film_id)
    JOIN category ca USING (category_id)
    WHERE ca.name = 'Children'
),

horror AS (
    SELECT actor_id
    FROM film f
    JOIN film_actor fa USING (film_id)
    JOIN film_category fc USING (film_id)
    JOIN category ca USING (category_id)
    WHERE ca.name = 'Horror'
)

SELECT first_name, last_name
FROM actor
WHERE actor_id IN (select * from yes_children) AND actor_id NOT IN (select * from horror)
ORDER BY last_name, first_name;


