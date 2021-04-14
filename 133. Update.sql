use employees;


UPDATE employees 
SET 
    first_name = 'stella',
    last_name = 'park',
    birth_date = '1990-12-31',
    gender = 'F'
WHERE
    emp_no = 999901;


SELECT 
    *
FROM
    employees
WHERE
    emp_no = 999901;



SELECT 
    *
FROM
    department_dup
ORDER BY dept_no;


commit; 



UPDATE department_dup 
SET 
    dept_no = 'd011',
    dept_name = 'Quality Control';

rollback; 
commit;


SELECT 
    *
FROM
    departments;
UPDATE departments 
SET 
    dept_name = 'Data Analysis'
WHERE
    dept_no = 'd010';
rollback;


DELETE FROM departments 
WHERE
    dept_no = 'd010';
SELECT 
    *
FROM
    departments;

