SELECT 
    managers.manager_name AS name
FROM
    (SELECT DISTINCT
        (man1.managerId) AS manager, man2.name AS manager_name
    FROM
        Employee man1
    JOIN Employee man2 ON (man1.managerId = man2.id)) AS managers
        JOIN
    Employee m1 ON (managers.manager = m1.managerId)
GROUP BY managers.manager
HAVING COUNT(m1.id) >= 5;
