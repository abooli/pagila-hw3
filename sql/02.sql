/*
 * Compute the country with the most customers in it. 
 */

SELECT country
FROM customer c
JOIN address a USING (address_id)
JOIN city ci USING (city_id)
JOIN country co USING (country_id)
GROUP BY country
ORDER BY count(country) desc
LIMIT 1;
