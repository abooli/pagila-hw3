/*
 * List all actors with Bacall Number 2;
 * That is, list all actors that have appeared in a film with an actor that has appeared in a film with 'RUSSELL BACALL',
 * but do not include actors that have Bacall Number < 2.
 */
SELECT DISTINCT a1.first_name || ' ' || a1.last_name AS "Actor Name" 
FROM actor a1
JOIN film_actor fa1 on (a1.actor_id = fa1.actor_id)
JOIN film_actor fa2 on (fa1.film_id = fa2.film_id)
JOIN actor a2 ON (fa2.actor_id = a2.actor_id)
JOIN film_actor fa3 on (fa2.film_id = fa3.film_id)
JOIN actor a3 ON (fa3.actor_id = a3.actor_id)

WHERE a3.first_name = 'RUSSELL' AND
      a3.last_name = 'BACALL' AND
      NOT (a1.first_name = 'RUSSELL' AND a1.last_name = 'BACALL') AND 
      NOT (a2.first_name = 'RUSSELL' AND a2.last_name = 'BACALL')

ORDER BY "Actor Name";
