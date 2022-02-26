/*
 * You love the acting in the movie 'AMERICAN CIRCUS' and want to watch other movies with the same actors.
 *
 * Write a SQL query that lists the title of all movies where at least 2 actors were also in 'AMERICAN CIRCUS'.
 *
 * HINT:
 * This can be solved with a self join on the film_actor table.
 */

WITH american_circus_actors AS (
    SELECT actor_id
    FROM film f, film_actor fa
    WHERE f.film_id = fa.film_id AND f.title = 'AMERICAN CIRCUS'
)

SELECT DISTINCT f.title
FROM film f
JOIN film_actor fa1 ON (f.film_id = fa1.film_id)
JOIN film_actor fa2 ON (f.film_id = fa2.film_id)
WHERE fa1 != fa2 AND 
      fa1.actor_id IN (select * from american_circus_actors) AND 
      fa2.actor_id IN (select * from american_circus_actors);
