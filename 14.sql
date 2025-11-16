-- Group the orders by date and calculate the average
--  number of pizzas ordered per day.
SELECT 
    orders.order_date, SUM(orders_details.quantity), 2
FROM
    orders
        JOIN
    orders_details ON orders.order_id = orders_details.order_id
GROUP BY orders.order_date;

SELECT 
    ROUND(AVG(quantity), 0) AS avg_pizza_ordered_perday
FROM
    (SELECT 
        orders.order_date, SUM(orders_details.quantity) AS quantity
    FROM
        orders
    JOIN orders_details ON orders.order_id = orders_details.order_id
    GROUP BY orders.order_date) AS order_quantity;