SELECT 
    pizzas.size, COUNT(pizzas.size) AS total
FROM
    order_details
        JOIN
    pizzas ON order_details.pizza_id = pizzas.pizza_id
GROUP BY pizzas.size
ORDER BY total DESC
LIMIT 1