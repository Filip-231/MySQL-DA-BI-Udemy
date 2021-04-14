select * from dept_emp;

SELECT 
    first_name, COUNT(first_name) AS names_count
FROM
    employees
GROUP BY first_name
HAVING COUNT(first_name) > 250 
ORDER BY first_name;


SELECT 
    *, AVG(salary)
FROM
    salaries
GROUP BY emp_no
HAVING AVG(salary) > 120000;
ORDER BY emp_no;


SELECT 
    first_name, COUNT(first_name) AS names_count
FROM
    employees
WHERE
    hire_date > '1999-01-01'
GROUP BY first_name
HAVING COUNT(first_name) < 200 
ORDER BY first_name DESC;


select emp_no, count(from_date)
from dept_emp
where from_date >'2000-01-01'
group by emp_no
having count(from_date)>1
order by emp_no;


select * from salaries
order by salary desc 
limit 10;




