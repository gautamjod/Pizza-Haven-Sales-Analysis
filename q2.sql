-- Calculate the total revenue generated from pizza sales.

select round(sum(o.quanity*p.price) ,2) as Revenue from order_details o join pizzas p on o.pizza_id=p.pizza_id