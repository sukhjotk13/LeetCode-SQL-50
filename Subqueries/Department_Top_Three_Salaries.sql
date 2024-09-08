WITH joined AS (
    SELECT
        d.id AS d_id,
        d.name AS d_name,
        e.id AS e_id,
        e.name AS e_name,
        e.salary,
        DENSE_RANK() OVER (PARTITION BY d.id ORDER BY e.salary DESC) AS level
    FROM
        Department d
    JOIN
        Employee e ON d.id = e.departmentId
)
SELECT
    d_name AS Department,
    e_name AS Employee,
    salary AS Salary
FROM
    joined
WHERE
    level <= 3
ORDER BY
    d_name, Salary DESC;
