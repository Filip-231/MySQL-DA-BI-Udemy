drop function if exists f_emp_avg_salary;
delimiter $$
create function f_emp_avg_salary (p_emp_no integer) returns decimal (10,2)
deterministic no sql READS SQL DATA 
begin 
declare v_avg_salary decimal(10,2); #nie mozemy skorzystac poza blokiem

begin
declare v_avg_salary_2 DECIMAL(10,2); #nie mozemy skorzystac z tej zmiennej poza blokiem
end;
    SELECT 
    AVG(s.salary)
INTO v_avg_salary FROM
    employees e
        JOIN
    salaries s ON e.emp_no = s.emp_no
WHERE
    e.emp_no = p_emp_no;
return v_avg_salary;
end $$
delimiter ; 

#select v_avg_salary; #nie zadziala

select f_emp_avg_salary(11300);


#session variable
set @s_var1=3;

select @s_var1; 


#global variable 239
#set global var_name=value;

set global max_connections=1000;

#set @@global.max_connections=1;
#only sys variables moga byc global


#set session sgl_mode='STRICT_TRANS_TABLES,NO_ZERO_DATE,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION';


#Create a trigger that checks if the hire date of an employee is higher than the current date. If true, set this date to be the current date. Format the output appropriately (YY-MM-DD).


DELIMITER $$

CREATE TRIGGER trig_hire_date  

BEFORE INSERT ON employees

FOR EACH ROW  

BEGIN  

                IF NEW.hire_date > date_format(sysdate(), '%Y-%m-%d') THEN     

                                SET NEW.hire_date = date_format(sysdate(), '%Y-%m-%d');     

                END IF;  

END $$  

DELIMITER ;  

   

INSERT employees VALUES ('999904', '1970-01-31', 'John', 'Johnson', 'M', '2025-01-01');  

SELECT 
    *
FROM
    employees
ORDER BY emp_no DESC;

#Indexes
select * from employees where hire_date>'2000-01-01';

create INDEX i_hire_date on employees(hire_date); # faster


select * from employees where first_name='Georgi' and last_name='Facello';
#composite index
create INDEX i_composite on employees(first_name, last_name); # faster

show index from employees from employees;
show index from employees;

ALTER TABLE employees
DROP INDEX i_hire_date;

#Select all records from the ‘salaries’ table of people whose salary is higher than $89,000 per annum.

#Then, create an index on the ‘salary’ column of that table, and check if it has sped up the search of the same SELECT statement.

select * from salaries where salary >89000;
create INDEX i_salary on salaries(salary);



#the case statement

select emp_no, first_name, last_name,
case gender when 'M' then 'Male' else 'Female'
end as gender
from employees;

select e.emp_no, e.first_name, e.last_name,
case when dm.emp_no is not null then 'Manager'
else 'Employee'
end as is_manager
from employees e
left join dept_manager dm on dm.emp_no=e.emp_no
where e.emp_no>109990
;

select emp_no, first_name, last_name,
if (gender ='M' , 'Male' , 'Female') as gender
from employees;



select dm.emp_no, e.first_name, e.last_name, max(s.salary)-min(s.salary) as salary_difference,
case 
when max(s.salary)-min(s.salary) >30000 then 'salary zwiekszone'
when max(s.salary)-min(s.salary)between 20000 and 30000 then 'salary pomiedzy'
else 'salary mniej zwieksozne'
end as salary_increase
from dept_manager dm
join employees e on e.emp_no=dm.emp_no
join salaries s on s.emp_no=dm.emp_no
group by s.emp_no
;


#Similar to the exercises done in the lecture, obtain a result set containing the employee number, first name, and last name of all employees with a number higher than 109990. Create a fourth column in the query, indicating whether this employee is also a manager, according to the data provided in the dept_manager table, or a regular employee. 

SELECT 
    e.emp_no,
    e.first_name,
    e.last_name,
    CASE
        WHEN dm.emp_no IS NOT NULL THEN 'Manager'
        ELSE 'Employee'
    END AS is_manager
FROM
    employees e
        LEFT JOIN
    dept_manager dm ON dm.emp_no = e.emp_no
WHERE
    e.emp_no > 109990;
    
#Extract a dataset containing the following information about the managers: employee number, first name, and last name. Add two columns at the end – one showing the difference between the maximum and minimum salary of that employee, and another one saying whether this salary raise was higher than $30,000 or NOT


select dm.emp_no, e.first_name, e.last_name, max(s.salary)-min(s.salary),
case 
when max(s.salary)-min(s.salary) >30000 then 'wieksze'
else 'nie'
end as czy
from dept_manager dm
join employees e on e.emp_no=dm.emp_no
join salaries s on s.emp_no=dm.emp_no
group by s.emp_no
;


SELECT 
    dm.emp_no,
    e.first_name,
    e.last_name,
    MAX(s.salary) - MIN(s.salary) AS salary_difference,
    IF(MAX(s.salary) - MIN(s.salary) > 30000,
        'Salary was raised by more then $30,000',
        'Salary was NOT raised by more then $30,000') AS salary_increase
FROM
    dept_manager dm
        JOIN
    employees e ON e.emp_no = dm.emp_no
        JOIN
    salaries s ON s.emp_no = dm.emp_no
GROUP BY s.emp_no;


#Extract the employee number, first name, and last name of the first 100 employees, and add a fourth column, called “current_employee” saying “Is still employed” if the employee is still working in the company, or “Not an employee anymore” if they aren’t.

#Hint: You’ll need to use data from both the ‘employees’ and the ‘dept_emp’ table to solve this exercise.

SELECT 
    e.emp_no,
    e.first_name,
    e.last_name,
    CASE
        WHEN MAX(de.to_date) > SYSDATE() THEN 'Is still employed'
        ELSE 'Not an employee anymore'
    END AS current_employee
FROM
    employees e
        JOIN
    dept_emp de ON de.emp_no = e.emp_no
GROUP BY de.emp_no
LIMIT 100;