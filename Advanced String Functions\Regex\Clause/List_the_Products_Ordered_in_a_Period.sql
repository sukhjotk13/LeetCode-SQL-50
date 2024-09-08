WITH cte AS (SELECT t1.product_id,SUM(t2.unit) AS unit
FROM Products t1 JOIN Orders t2
ON (t1.product_id=t2.product_id)
WHERE YEAR(t2.order_date)=2020 AND MONTH(t2.order_date)=2
GROUP BY product_id
HAVING SUM(t2.unit)>=100)
SELECT p1.product_name,c1.unit AS unit
FROM cte c1 JOIN Products p1
ON (c1.product_id=p1.product_id);
