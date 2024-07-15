-- Determine the top 3 most ordered pizza types based on revenue for each pizza category.
with ct2 as(
WITH ct as(
SELECT 
	pizza_types.category as category,
    pizza_types.name,
    round(SUM(order_details.quanity * pizzas.price),2) AS sales
FROM
    pizza_types
        JOIN
    pizzas ON pizza_types.pizza_type_id = pizzas.pizza_type_id
        JOIN
    order_details ON order_details.pizza_id = pizzas.pizza_id
GROUP BY pizza_types.name,pizza_types.category
order by pizza_types.category)
select *,rank() over(partition by category order by sales desc) as rn  from ct)
select * from ct2 where rn<=3
