(SELECT 
    employee_id, department_id
FROM
    EMPLOYEE
WHERE
    primary_flag = 'Y') UNION ALL (SELECT 
    employee_id, department_id
FROM
    EMPLOYEE
GROUP BY employee_id
HAVING COUNT(department_id) = 1);
