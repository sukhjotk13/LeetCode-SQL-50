WITH swapped AS (
    SELECT
        s1.id AS id,
        COALESCE(s2.student, s1.student) AS student
    FROM
        Seat s1
    LEFT JOIN
        Seat s2
    ON
        s1.id = s2.id - 1
    WHERE
        s1.id % 2 = 1
        AND s1.id < (SELECT MAX(id) FROM Seat)
    
    UNION ALL
    
    SELECT
        s1.id AS id,
        COALESCE(s2.student, s1.student) AS student
    FROM
        Seat s1
    LEFT JOIN
        Seat s2
    ON
        s1.id = s2.id + 1
    WHERE
        s1.id % 2 = 0

    UNION ALL
    
    SELECT
        s1.id AS id,
        s2.student AS student
    FROM
        Seat s1
    LEFT JOIN
        Seat s2
    ON
        s1.id = s2.id
    WHERE
        s1.id = (SELECT MAX(id) FROM Seat)
        AND s1.id % 2 = 1
)

SELECT
    id,
    student
FROM
    swapped
ORDER BY
    id;
    
