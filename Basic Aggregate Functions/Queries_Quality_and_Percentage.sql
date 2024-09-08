SELECT 
    query_name,
    ROUND(AVG(rating / position), 2) AS quality,
    ROUND((100.0 * COUNT(CASE
                WHEN rating < 3 THEN 1
            END) / COUNT(*)),
            2) AS poor_query_percentage
FROM
    Queries
WHERE
    query_name IS NOT NULL
GROUP BY query_name;
