-- Analyze the cumulative revenue generated over time.
select order_date,sum(revenue) over( order by order_date ) as cumulative_revenue from 
(SELECT 
    orders.order_date,
    ROUND(SUM(order_details.quanity * pizzas.price),
            2) as revenue
FROM
    order_details
        JOIN
    pizzas ON order_details.pizza_id = pizzas.pizza_id
        JOIN
    orders ON orders.order_id = order_details.order_id
GROUP BY orders.order_date) as sales