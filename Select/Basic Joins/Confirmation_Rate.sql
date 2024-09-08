 WITH total AS(
    SELECT m1.user_id AS user_id_t ,m2.action AS action,COUNT(m2.action) AS total_req
    FROM Signups m1 LEFT JOIN 
    Confirmations m2
    ON (m1.user_id=m2.user_id
    )
    GROUP BY m1.user_id   
), confirmation AS
(
 SELECT j1.user_id AS user_id_c ,j2.action AS action,COUNT(j2.action) AS con_req
    FROM Signups j1 LEFT JOIN 
    Confirmations j2
    ON (j1.user_id=j2.user_id
    )
    WHERE j2.action='confirmed'
    GROUP BY j1.user_id  
    
    )
SELECT t.user_id_t AS user_id, ROUND(COALESCE(c.con_req / NULLIF(t.total_req, 0), 0),2) AS confirmation_rate 
FROM total t LEFT JOIN
confirmation c
ON (t.user_id_t=c.user_id_c);
