SELECT 
    p.product_id,
    CASE
        WHEN ROUND(SUM(p.price * u.units) / SUM(u.units), 2) IS NULL THEN 0
        ELSE ROUND(SUM(p.price * u.units) / SUM(u.units), 2)
    END AS average_price
FROM
    Prices p
        LEFT JOIN
    UnitsSold u ON (p.product_id = u.product_id)
WHERE
    p.start_date <= u.purchase_date
        AND u.purchase_date <= p.end_date
        OR purchase_date IS NULL
GROUP BY product_id;
