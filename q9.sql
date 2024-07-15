-- Group the orders by date and calculate the average number of pizzas ordered per day.
with ct as(

SELECT 
    SUM(order_details.quanity) as total , orders.order_date
FROM
    orders
        JOIN
    order_details ON orders.order_id = order_details.order_id
    group by orders.order_date
)
select avg(total) as average from ct