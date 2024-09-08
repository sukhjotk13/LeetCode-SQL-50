WITH cte AS (SELECT DISTINCT(salary) AS SecondHighest
FROM Employee
ORDER BY SecondHighest DESC
LIMIT 1 OFFSET 1)
(SELECT SecondHighest AS SecondHighestSalary
FROM cte)
UNION ALL
(
    SELECT null
    WHERE NOT EXISTS(SELECT SecondHighest AS SecondHighestSalary
FROM cte)
);
