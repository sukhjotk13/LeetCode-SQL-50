WITH first_year AS(
    SELECT product_id,min(year) AS min_year
    FROM Sales
    GROUP BY product_id
)
SELECT f.product_id,f.min_year AS first_year,s.quantity AS quantity,s.price AS price
FROM first_year f JOIN Sales s
ON (f.product_id=s.product_id
AND f.min_year=s.year);
