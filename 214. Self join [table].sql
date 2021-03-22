select * from emp_manager order by emp_manager.emp_no;


SELECT 
    e1.*
FROM
    emp_manager e1
        JOIN
    emp_manager e2 ON e1.emp_no = e2.manager_no
where e2.emp_no in (select manager_no from emp_manager);    
;

select * from dept_emp;

select emp_no ,from_date ,to_date, count(emp_no) as num
from 
dept_emp
group by emp_no
having num >1;



create or replace view v_dept_emp_latest_date as 
select 
emp_no, max(from_date) as from_date, max(to_date) as to_date
from dept_emp
group by emp_no;


SELECT * FROM employees.v_dept_emp_latest_date;


-- Create a view that will extract the average salary of all managers registered in the database. Round this value to the nearest cent.

-- If you have worked correctly, after executing the view from the “Schemas” section in Workbench, you should obtain the value of 66924.27.

CREATE OR REPLACE VIEW v_manager_avg_salary AS
    SELECT 
        ROUND(AVG(salary), 2)
    FROM
        salaries s
            JOIN
        dept_manager m ON s.emp_no = m.emp_no;
