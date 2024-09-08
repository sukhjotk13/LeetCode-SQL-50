SELECT 
    machine_id,
    ROUND(AVG(processing_time), 3) AS processing_time
FROM
    (SELECT 
        a1.machine_id AS machine_id,
            a1.process_id,
            a2.activity_type,
            (a2.timestamp - a1.timestamp) AS processing_time
    FROM
        Activity a1
    JOIN Activity a2 ON (a1.machine_id = a2.machine_id
        AND a1.process_id = a2.process_id)
    WHERE
        a1.activity_type = 'start'
            AND a2.activity_type = 'end') AS processing_times
GROUP BY machine_id;
