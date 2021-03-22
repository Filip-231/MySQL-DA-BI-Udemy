select * from dept_manager_dup order by dept_no;
select * from department_dup order by dept_no;

SELECT  
    m.dept_no, m.emp_no, d.dept_name 
FROM
    dept_manager_dup m 
        INNER JOIN 
    department_dup d ON m.dept_no = d.dept_no 
group by m.emp_no 
ORDER BY m.dept_no; 


SELECT 
    e.emp_no, e.first_name, e.last_name, dm.dept_no, e.hire_date
FROM
    employees e
        JOIN
    dept_manager dm ON e.emp_no = dm.emp_no;


select * from dept_manager_dup order by dept_no ASC;
select * from department_dup order by dept_no ASC;



insert into dept_manager_dup
values ('110228','d003','1992-03-21','9999-01-01');
insert into department_dup
values ('d009','Customer Service');









