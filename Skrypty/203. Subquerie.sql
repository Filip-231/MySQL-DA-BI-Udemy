select * from dept_manager;


select e.first_name, e.last_name
from 
employees e
where e.emp_no in (select dm.emp_no from dept_manager dm); #sub query najpierw sie wywoluje


select dm.emp_no from dept_manager dm; #mozemy uruchomic oddzielnie zwraca nam 24 numery


#Extract the information about all department managers who were hired between the 1st of January 1990 and the 1st of January 1995.
SELECT 
    *
FROM
    dept_manager
WHERE
    emp_no IN (SELECT 
            emp_no
        FROM
            employees
        WHERE
            hire_date BETWEEN '1990-01-01' AND '1995-01-01');
            
            
#exists to samo 
select e.first_name, e.last_name
from 
employees e
where exists ( select * from dept_manager dm where dm.emp_no =e.emp_no)
order by emp_no; #szybsze na duzych zbiorach #order na zewnetrznym query

#Select the entire information for all employees whose job title is “Assistant Engineer”. 
select * from employees;
select * from titles;

SELECT 
    *
FROM
    employees e
WHERE
    e.emp_no IN (SELECT 
            t.emp_no
        FROM
            titles t
        WHERE
            t.emp_no = e.emp_no
                AND t.title = 'Assistant Engineer');


SELECT 

    *
FROM
    employees e
WHERE
    EXISTS( SELECT 
            *
        FROM
            titles t
        WHERE
            t.emp_no = e.emp_no
                AND title = 'Assistant Engineer');

#########################################
SELECT 
    A.*
FROM
    (SELECT 
        e.emp_no AS employee_id,
            MIN(de.dept_no) AS department_code,
            (SELECT 
                    emp_no
                FROM
                    dept_manager
                WHERE
                    emp_no = 110022) AS manager_ID
    FROM
        employees e
    JOIN dept_emp de ON e.emp_no = de.emp_no
    WHERE
        e.emp_no <= 10020
    GROUP BY e.emp_no
    ORDER BY e.emp_no) AS A 
UNION SELECT 
    B.*
FROM
    (SELECT 
        e.emp_no AS employee_id,
            MIN(de.dept_no) AS department_code,
            (SELECT 
                    emp_no
                FROM
                    dept_manager
                WHERE
                    emp_no = 110039) AS manager_ID
    FROM
        employees e
    JOIN dept_emp de ON e.emp_no = de.emp_no
    WHERE
        e.emp_no > 10020
    GROUP BY e.emp_no
    ORDER BY e.emp_no
    LIMIT 20) AS B;

#Starting your code with “DROP TABLE”, create a table called “emp_manager” (emp_no – integer of 11, not null; dept_no – CHAR of 4, null; manager_no – integer of 11, not null).
drop table if exists emp_manager;

create table emp_manager(
	emp_no int(11) not null,
    dept_no char(4) null,
    manager_no int(11) not null

) ;


Insert INTO emp_manager
select U.* from (
SELECT 
    A.*
FROM
    (SELECT 
        e.emp_no AS employee_id,
            MIN(de.dept_no) AS department_code,
            (SELECT 
                    emp_no
                FROM
                    dept_manager
                WHERE
                    emp_no = 110022) AS manager_ID
    FROM
        employees e
    JOIN dept_emp de ON e.emp_no = de.emp_no
    WHERE
        e.emp_no <= 10020
    GROUP BY e.emp_no
    ORDER BY e.emp_no) AS A 
UNION SELECT 
    B.*
FROM
    (SELECT 
        e.emp_no AS employee_id,
            MIN(de.dept_no) AS department_code,
            (SELECT 
                    emp_no
                FROM
                    dept_manager
                WHERE
                    emp_no = 110039) AS manager_ID
    FROM
        employees e
    JOIN dept_emp de ON e.emp_no = de.emp_no
    WHERE
        e.emp_no > 10020
    GROUP BY e.emp_no
    ORDER BY e.emp_no
    LIMIT 20) AS B
    
    UNION SELECT 
    C.*
FROM
    (SELECT 
        e.emp_no AS employee_id,
            MIN(de.dept_no) AS department_code,
            (SELECT 
                    emp_no
                FROM
                    dept_manager
                WHERE
                    emp_no = 110039) AS manager_ID
    FROM
        employees e
    JOIN dept_emp de ON e.emp_no = de.emp_no
    WHERE
        e.emp_no = 110022
    GROUP BY e.emp_no
    ORDER BY e.emp_no
    LIMIT 20) AS C
    UNION SELECT 
    D.*
FROM
    (SELECT 
        e.emp_no AS employee_id,
            MIN(de.dept_no) AS department_code,
            (SELECT 
                    emp_no
                FROM
                    dept_manager
                WHERE
                    emp_no = 110022) AS manager_ID
    FROM
        employees e
    JOIN dept_emp de ON e.emp_no = de.emp_no
    WHERE
        e.emp_no = 110039
    GROUP BY e.emp_no
    ORDER BY e.emp_no
    LIMIT 20) AS D
   )as U ;














#Fill emp_manager with data about employees, the number of the department they are working in, and their managers.

-- Your query skeleton must be:

-- Insert INTO emp_manager SELECT

-- U.*

-- FROM

--                  (A)

-- UNION (B) UNION (C) UNION (D) AS U;

-- A and B should be the same subsets used in the last lecture (SQL Subqueries Nested in SELECT and FROM). In other words, assign employee number 110022 as a manager to all employees from 10001 to 10020 (this must be subset A), and employee number 110039 as a manager to all employees from 10021 to 10040 (this must be subset B).

-- Use the structure of subset A to create subset C, where you must assign employee number 110039 as a manager to employee 110022.

-- Following the same logic, create subset D. Here you must do the opposite - assign employee 110022 as a manager to employee 110039.

-- Your output must contain 42 rows.
