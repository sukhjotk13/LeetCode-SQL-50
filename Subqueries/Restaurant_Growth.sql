WITH new AS (
    SELECT visited_on,SUM(amount) AS amount
    FROM Customer
    GROUP BY visited_on
)
,running AS(
SELECT 
    visited_on,
    SUM(amount) OVER (
        ORDER BY visited_on 
        ROWS BETWEEN 6 PRECEDING AND CURRENT ROW
    ) AS amount,
    ROUND(AVG(amount) OVER (
        ORDER BY visited_on 
        ROWS BETWEEN 6 PRECEDING AND CURRENT ROW
    ), 2) AS average_amount
FROM new
GROUP BY visited_on
ORDER BY visited_on
)
SELECT visited_on,amount,average_amount
FROM running
WHERE visited_on>=(SELECT DATE_ADD(MIN(visited_on), INTERVAL 6 DAY) FROM Customer);
