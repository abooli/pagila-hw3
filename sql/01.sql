/*
 * Compute the number of customers who live outside of the US.
 */

SELECT count(*)
FROM customer c 
JOIN address a USING (address_id)
JOIN city ci USING (city_id)
WHERE ci.country_id NOT IN(
    SELECT country_id
    FROM country
    WHERE country = 'United States');
