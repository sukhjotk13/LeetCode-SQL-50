WITH ranges AS (
    SELECT account_id,income,
    CASE 
     WHEN income<20000 THEN "Low Salary"
     WHEN income BETWEEN 20000 AND 50000 THEN "Average Salary"
     WHEN income>50000 THEN "High Salary"
    END AS category
FROM Accounts
), category_counts AS
(SELECT category,COUNT(account_id) AS accounts_count
FROM ranges
GROUP BY category)

SELECT categories.category, COALESCE(accounts_count,0) AS accounts_count
FROM (
    SELECT "Average Salary" AS category
    UNION ALL
    SELECT "Low Salary"
    UNION ALL
    SELECT "High Salary"
) AS categories
LEFT JOIN category_counts
ON (categories.category=category_counts.category);
