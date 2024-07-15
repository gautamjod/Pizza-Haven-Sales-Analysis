-- Calculate the percentage contribution of each pizza type to total revenue.
with ct as (
SELECT 
    pizza_types.category AS pizza,
    ROUND(SUM(order_details.quanity * pizzas.price),
            2) AS revenue
FROM
    pizza_types
        JOIN
    pizzas ON pizza_types.pizza_type_id = pizzas.pizza_type_id
        JOIN
    order_details ON order_details.pizza_id=pizzas.pizza_id
    group by pizza
),ct2 as(
select round(sum(revenue),2) as total_revenue from ct)
select pizza, (revenue/total_revenue)*100 as percentage from ct cross join ct2