SELECT 
    e1.unique_id, e.name
FROM
    Employees AS e
        LEFT JOIN
    EmployeeUNI AS e1 ON (e.id = e1.id);
