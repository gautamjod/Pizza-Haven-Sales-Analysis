SELECT 
    pizza_types.name, SUM(order_details.quanity) as total
FROM
    pizza_types
        JOIN
    pizzas ON pizza_types.pizza_type_id = pizzas.pizza_type_id
        JOIN
    order_details on order_details.pizza_id=pizzas.pizza_id 
    group by 
    pizza_types.name
    order by total desc
    limit 5