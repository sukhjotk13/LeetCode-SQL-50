WITH first AS (SELECT l1.id,l1.num,l2.num AS num1
FROM Logs l1 JOIN Logs l2
ON (l1.id+1=l2.id )), 

second AS
(
    SELECT f.id,f.num,f.num1,l3.num AS num2
    FROM first f JOIN Logs l3
    ON (f.id+2=l3.id)
)

SELECT DISTINCT(num) AS ConsecutiveNums FROM second
WHERE num=num1 AND num=num2;
