/*
 * List the total amount of money that customers from each country have payed.
 * Order the results from most to least money.
 */

SELECT country, sum(amount) as "total_payments"
FROM payment p
JOIN customer cu USING (customer_id)
JOIN address a USING (address_id)
JOIN city ci USING (city_id)
JOIN country co USING (country_id)
GROUP BY country
ORDER BY "total_payments" desc, country;
