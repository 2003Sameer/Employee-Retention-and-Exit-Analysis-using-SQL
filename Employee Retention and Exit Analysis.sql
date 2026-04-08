-- Employee Retention and Exit Analysis

-- importing dataset and exploring
SELECT * FROM employee;

-- SOLVING QUESTIONS.
-- Q1. How many employee record are present in the dataset ?
SELECT DISTINCT
    COUNT(*) AS Employee_Count
FROM
    employee;


-- Q2. What is the distribution of retained and exited employee ?
SELECT 
    exit_status, COUNT(*) AS Employee_Status
FROM
    employee
GROUP BY exit_status;


-- Q3. What is the average age of the employee ?
SELECT 
    ROUND(AVG(age), 2) AS Average_Employee_Age
FROM
    employee;


-- Q4. Is there any difference between average age of retained and exited employee ?
SELECT 
    exit_status, AVG(age) AS Average_Employee_Age
FROM
    employee
GROUP BY exit_status;

-- Q5. How are employee distributed across department ?
SELECT 
    department, COUNT(employee_id) AS Employee_Count
FROM
    employee
GROUP BY department;


-- Q6. Which department has highest number of employee exits ?
SELECT 
    department, COUNT(employee_id) AS Employee_Exit_Count
FROM
    employee
WHERE
    exit_status = 1
GROUP BY department
ORDER BY Employee_Exit_Count DESC
LIMIT 1;


-- Q7. Does salary differ between retained and exited employee ?
SELECT 
    exit_status,
    ROUND(AVG(monthly_income), 2) AS Average_Monthly_Income
FROM
    employee
GROUP BY exit_status; 


-- Q8. How many employee work overtime ?
SELECT 
    COUNT(employee_id) AS Work_Overtime
FROM
    employee
WHERE
    overtime = 1;


-- Q9. Is job satisfaction different for exited employee ?
SELECT 
    exit_status,
    ROUND(AVG(job_satisfaction), 2) AS Avg_Job_Satisfaction
FROM
    employee
GROUP BY exit_status;


-- Q10. How does work life balance vary by exit status ?
SELECT 
    exit_status,
    ROUND(AVG(work_life_balance), 2) AS Avg_Work_Life_Balance
FROM
    employee
GROUP BY exit_status;


-- Q11. How many employee have less than 2 year in a company ?
SELECT 
    COUNT(employee_id) AS Employee_Count
FROM
    employee
WHERE
    years_at_company < 2;


-- Q12. What is most common performance rating among employee who exited ?
SELECT 
    performance_rating,
    COUNT(performance_rating) AS Count_Performance_Rating
FROM
    employee
WHERE
    exit_status = 1
GROUP BY performance_rating
ORDER BY Count_Performance_Rating DESC
LIMIT 1;


-- Q13. What percentage of employees have exited the organization ?
SELECT 
    ((SELECT 
            COUNT(employee_id)
        FROM
            employee
        WHERE
            exit_status = 1) / COUNT(employee_id)) * 100 AS Emp_Exit_Percentage
FROM
    employee;
-- OTHER METHOD -- 
SELECT 
    COUNT(CASE
        WHEN exit_status = 1 THEN 1
    END) * 100 / COUNT(*) AS Emp_Exit_Percentage
FROM
    employee;


-- Q14. Do exited employee have lower tenure than retained employee ?
SELECT 
    exit_status, ROUND(AVG(years_at_company), 2) AS Avg_Tenure
FROM
    employee
GROUP BY exit_status;


-- Q15. Are employee working overtime more likely to exit ?
SELECT 
    overtime, COUNT(employee_id) AS Exit_Emp_Count
FROM
    employee
WHERE
    exit_status = 1
GROUP BY overtime
