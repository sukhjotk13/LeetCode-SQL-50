SELECT 
    CONCAT(YEAR(trans_date),
            '-',
            LPAD(MONTH(trans_date), 2, 0)) AS month,
    country,
    COUNT(*) AS trans_count,
    COALESCE(COUNT(CASE
                WHEN state = 'approved' THEN 1
            END),
            0) AS approved_count,
    SUM(amount) AS trans_total_amount,
    COALESCE(SUM(CASE
                WHEN state = 'approved' THEN amount
            END),
            0) AS approved_total_amount
FROM
    Transactions
GROUP BY CONCAT(YEAR(trans_date), MONTH(trans_date)) , country;
