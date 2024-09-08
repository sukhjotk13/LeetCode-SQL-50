WITH prices AS(
SELECT product_id,max(change_date) AS date
FROM Products
WHERE change_date<='2019-08-16'
GROUP BY product_id)
(SELECT p1.product_id,p2.new_price AS price
FROM prices p1 JOIN Products p2
ON (p1.product_id=p2.product_id AND
p1.date=p2.change_date))
UNION ALL
(SELECT DISTINCT(product_id),10
FROM Products
WHERE change_date>'2019-08-16' AND product_id  NOT IN (SELECT product_id FROM Products
WHERE change_date<='2019-08-16'))
ORDER BY product_id;
