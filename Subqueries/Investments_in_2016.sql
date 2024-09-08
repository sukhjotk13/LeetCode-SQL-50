WITH same_loc AS(
    SELECT t1.pid AS pid_loc,COUNT(t1.pid) AS cnt
    FROM Insurance t1 JOIN Insurance t2
    ON (t1.lat=t2.lat 
    AND t1.lon=t2.lon
    AND t1.pid!=t2.pid)
    GROUP BY t1.pid
    HAVING COUNT(t1.pid)>=1
)
,same_2015 AS (
    SELECT i1.pid AS pid1, i2.pid AS pid2, i1.tiv_2016 AS tiv_2016_1, i2.tiv_2015
    FROM Insurance i1
    JOIN Insurance i2
    ON (i1.tiv_2015 = i2.tiv_2015
        AND i1.pid != i2.pid
        )
    WHERE i1.pid NOT IN (SELECT pid_loc FROM same_loc )
    ORDER BY i1.pid
)
SELECT ROUND(SUM(tiv_2016),2) AS tiv_2016
FROM Insurance
WHERE pid IN (SELECT DISTINCT pid1 FROM same_2015);
