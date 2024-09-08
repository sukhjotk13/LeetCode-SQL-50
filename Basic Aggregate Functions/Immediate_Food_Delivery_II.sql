WITH orders AS (
    SELECT customer_id,order_date,customer_pref_delivery_date,CASE WHEN  order_date=customer_pref_delivery_date THEN 'immediate' ELSE 'scheduled' END AS status
    FROM Delivery
    ORDER BY customer_id,order_date
 ), cust_first_order AS (
    SELECT customer_id,min(order_date) AS min_order_date
    FROM Delivery
    GROUP BY customer_id
 ), req_table AS(
    SELECT c.customer_id,o.status
    FROM cust_first_order c JOIN orders o
    ON (c.customer_id=o.customer_id
    AND
    c.min_order_date=o.order_date)
 )

SELECT ROUND(100.0*COUNT(CASE WHEN status='immediate' THEN 1 END)/COUNT(*),2) AS immediate_percentage
FROM req_table;
