
select * from salaries order by salary desc limit 10;
select count(salary) from salaries;
select count(*) from salaries;

select count(distinct dept_no) from dept_emp;


select sum(salary) from salaries where from_date>'1997-01-01';
select max(salary) from salaries;
select min(salary) from salaries;
select round(avg(salary),2) from salaries;


select dept_no, ifnull(dept_name, "nie ma") as dept_name from department_dup;

select * from department_dup;
select dept_no, dept_name, coalesce(dept_no,dept_name, 'nie ma') as dept_name from department_dup order by dept_no ASC;



select dept_no, dept_name, coalesce('Customer Service') as dept_name from department_dup order by dept_no ASC;

SELECT

    IFNULL(dept_no, 'N/A') as dept_no,

    IFNULL(dept_name,

            'Department name not provided') AS dept_name,

    COALESCE(dept_no, dept_name) AS dept_info


FROM

    department_dup

ORDER BY dept_no ASC
