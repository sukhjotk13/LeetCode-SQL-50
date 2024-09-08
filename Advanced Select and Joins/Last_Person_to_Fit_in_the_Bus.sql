WITH weights AS (SELECT 
  turn AS Turn,
  person_id AS ID,
  person_name AS Name,
  weight AS Weight,
  SUM(weight) OVER (ORDER BY turn) AS Total_Weight
FROM Queue)
SELECT Name AS person_name FROM weights
WHERE Total_Weight= (
    SELECT MAX(Total_Weight) FROM weights
    WHERE Total_Weight<=1000
)
LIMIT 1;
