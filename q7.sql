-- Determine the distribution of orders by hour of the day.

SELECT 
    HOUR(order_time) AS hours, COUNT(order_id) AS order_id_count
FROM
    orders
GROUP BY hours