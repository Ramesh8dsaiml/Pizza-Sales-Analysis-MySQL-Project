-- Analyze the cumulative revenue generated over time.

select order_date,
sum(revenue) over (order by order_date) as cum_revenue
from(select orders.order_date,
 sum(orders_details.quantity * pizzas.price) as revenue 
 from orders_details join pizzas 
 on orders_details.pizza_id = pizzas.pizza_id
 join orders
 on orders.order_id = orders_details.order_id
 group by orders.order_date) as sales;




SELECT 
    sales.order_date,
    SUM(sales.revenue) OVER (ORDER BY sales.order_date) AS cum_revenue
FROM (
    SELECT 
        o.order_date AS order_date,
        SUM(od.quantity * p.price) AS revenue
    FROM orders_details od
    JOIN pizzas p 
            ON od.pizza_id = p.pizza_id
    JOIN orders o 
            ON o.order_id = od.order_id
    GROUP BY o.order_date
) AS sales
ORDER BY sales.order_date;
