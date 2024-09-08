WITH managers AS(
    SELECT e1.reports_to AS employee_id, e2.name, COUNT(*) AS reports_count
    FROM Employees e1 JOIN Employees e2
    ON (e1.reports_to=e2.employee_id)
    GROUP BY e1.reports_to
)
SELECT m.employee_id,m.name,m.reports_count, ROUND(AVG(e3.age)) AS average_age
FROM managers m JOIN Employees e3
ON(m.employee_id=e3.reports_to)
GROUP BY m.employee_id
ORDER BY m.employee_id;
