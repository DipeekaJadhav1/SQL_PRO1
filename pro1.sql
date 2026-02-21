use exam ;
SELECT 
    *
FROM
    emp;


-- - List all employee names from the dataset.
SELECT 
    name
FROM
    emp;
 
 -- - Retrieve the phone numbers of employees living iempempn Delhi.
SELECT 
    phone
FROM
    emp
WHERE
    city = 'delhi';

-- - Show the email IDs of employees whose DOB is before 1992.
SELECT 
    email, name, dob
FROM
    emp
WHERE
    dob < '1992-01-01';
 
 -- - Display Eid and Name in ascending order of Eid.
SELECT 
    eid, name
FROM
    emp
ORDER BY eid;

-- - Find the city of employee Ramesh Gupta.
SELECT 
    city, name
FROM
    emp
WHERE
    name = 'Ramesh Gupta';
-- 

SELECT 
    NAME, DOJ
FROM
    EMP
WHERE
    DOJ = '2012-03-15';

-- - Display names and emails of employees whose city is Gurgaon.
SELECT 
    name, email, city
FROM
    emp
WHERE
    city = 'Gurgaon';

-- - Sort employees by DOB in ascending order.
SELECT 
    name, dob
FROM
    emp
ORDER BY dob;

-- Count how many employees belong to each city.
SELECT 
    city, COUNT(*) AS city_count
FROM
    emp
GROUP BY city;

-- - Show Eid, Name, and Phone for employees whose email domain is Yahoo.
SELECT 
    eid, name, phone
FROM
    emp
WHERE
    email LIKE '%@Yahoo.%';

-- - Retrieve employees whose addr1 contains 'SECTOR'.
SELECT 
    name, addr1
FROM
    emp
WHERE
    addr1 LIKE 'SECTOR%';

SELECT 
    *
FROM
    emp;

-- - Display employees ordered lexicographically by Name.
SELECT 
    eid, name
FROM
    emp
ORDER BY name;
 
-- - Find employees whose DOB is after 1992 and city = Delhi.
SELECT 
    name, dob, city
FROM
    emp
WHERE
    city = 'delhi' AND dob > '1992-01-01';

-- Show Eid, Name, DOJ for employees where DOJ = DOB + 8000 days (date calculation challenge).
SELECT 
    eid,
    name,
    dob,
    doj,
    DATE_ADD(dob, INTERVAL 8000 DAY) AS dob_plus_8000
FROM
    emp;

-- Retrieve employees whose phone numbers start with '99'.
SELECT 
    name, phone
FROM
    emp
WHERE
    phone LIKE '99%';

-- Display employees grouped by addr2, showing count per group.
SELECT 
    addr2, COUNT(*) AS emp_count
FROM
    emp
GROUP BY addr2;

-- Find employees whose email username (before @) contains the digit 1.
SELECT 
    name, email AS emp_email
FROM
    emp
WHERE
    email LIKE '%1%@%';

-- Show Eid, Name, DOB, DOJ where DOJ < DOB (data validation check).
SELECT 
    eid, name, dob, doj
FROM
    emp
WHERE
    doj < dob;


SELECT 
    *
FROM
    emp_sal;
SELECT 
    *
FROM
    emp;

-- joins
-- List all employees with their department names.
SELECT 
    e.name, es.dept
FROM
    emp AS e
        INNER JOIN
    emp_sal AS es ON e.eid = es.eid;

-- Show employee names along with their designations.
SELECT 
    e.name, es.desi
FROM
    emp AS e
        INNER JOIN
    emp_sal AS es ON e.eid = es.eid;

-- Display employee names and their basic salary.
SELECT 
    e.name, es.basic_sal
FROM
    emp AS e
        INNER JOIN
    emp_sal AS es ON e.eid = es.eid;

-- Retrieve employee names, city, and salary using an INNER JOIN.
SELECT 
    e.name, e.city, es.SALARY
FROM
    emp AS e
        INNER JOIN
    emp_sal AS es ON e.eid = es.eid;

-- Find employees who do not have salary records using a LEFT JOIN.
SELECT 
    e.name, es.SALARY
FROM
    emp AS e
        LEFT JOIN
    emp_sal AS es ON e.eid = es.eid
WHERE
    es.SALARY IS NULL;


-- List employees with their salary details where salary > 50,000.
SELECT 
    e.name, es.salary
FROM
    emp AS e
        INNER JOIN
    emp_sal AS es ON e.eid = es.eid
WHERE
    es.salary > 50000;

-- Show employee names, department, and total salary (basic_sal + hra - pf).
SELECT 
    e.name,
    es.dept,
    (es.basic_sal + es.hra - es.pf) AS total_salary
FROM
    emp AS e
        INNER JOIN
    emp_sal AS es ON e.eid = es.eid;

-- Retrieve employees who joined after 2013 along with their department.
SELECT 
    e.name, e.doj, es.dept
FROM
    emp AS e
        LEFT JOIN
    emp_sal AS es ON e.eid = es.eid
WHERE
    e.doj > '2013-12-31';

SELECT 
    doj
FROM
    emp;

-- Display employees grouped by department with average salary.
SELECT 
    es.dept, AVG(es.salary) AS avg_sal
FROM
    emp_sal AS es
GROUP BY es.DEPT;

-- Find employees whose city is 'Pune' and show their designation and salary.
SELECT 
    e.name, e.city, es.desi, es.salary
FROM
    emp AS e
        INNER JOIN
    emp_sal AS es ON e.eid = es.eid
WHERE
    e.city = 'Pune';

-- Show employees with missing phone numbers along with their department.
SELECT 
    e.name, e.phone, es.dept
FROM
    emp AS e
        INNER JOIN
    emp_sal AS es ON e.eid = es.eid
WHERE
    e.phone IS NULL;

SELECT 
    eid, phone
FROM
    emp;
-- emp = eid, name , addr1, addr2, city, phone, email, dob, doj
-- emp_sal = eid , dept, desi, salary basic_sal, hra, pf 


SELECT 
    e.name, es.salary, es.detp, es.desi
FROM
    emp AS e
        INNER JOIN
    emp_sal AS es ON e.eid = es.eid
ORDER BY es.salary DESC
LIMIT 3;

-- chatgtp
SELECT 
    e.name, es.salary, es.dept, es.desi
FROM
    emp AS e
        INNER JOIN
    emp_sal AS es ON e.eid = es.eid
ORDER BY es.salary DESC
LIMIT 3;

-- Show department-wise highest salary and the employee who earns it.
SELECT 
    es.dept, es.salary, e.name
FROM
    emp AS e
        INNER JOIN
    emp_sal AS es ON es.eid = e.eid
ORDER BY es.dept DESC;
 -- this sorting by department, which doesn’t actually give mi the highest salary per department. 

SELECT 
    es.dept, es.salary, e.name
FROM
    emp AS e
        INNER JOIN
    emp_sal AS es ON es.eid = e.eid
WHERE
    (es.dept , es.salary) IN (SELECT 
            dept, MAX(salary)
        FROM
            emp_sal
        GROUP BY dept)
ORDER BY es.dept DESC


-- Retrieve employees whose salary is above the department average.
SELECT 
    e.name, es.salary, es.dept
FROM
    emp AS e
        INNER JOIN
    emp_sal AS es ON es.eid = e.eid
WHERE
    es.salary > (SELECT 
            AVG(salary)
        FROM
            emp_sal
        WHERE
            dept = es.dept)


-- emp = eid, name , addr1, addr2, city, phone, email, dob, doj
-- emp_sal = eid , dept, desi, salary basic_sal, hra, pf  

-- Display employees with more than 5 years of service and their salary details.

SELECT e.name,e.doj,
TIMESTAMPDIFF(YEAR, e.doj, CURDATE()) AS total_experience,es.salary
FROM emp AS e
INNER JOIN emp_sal AS es 
    ON e.eid = es.eid
WHERE TIMESTAMPDIFF(YEAR, e.doj, CURDATE()) > 5;





