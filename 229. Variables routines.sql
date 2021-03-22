
set @v_avg_salary = 0;
call employees.emp_avg_salary_out(11300,@v_avg_salary);
select @v_avg_salary;

set @v_emp_no = 0;
call employees.emp_info2('Aruna', 'Journel',@v_emp_no);
select @v_emp_no;

use employees;
drop function if exists f_emp_avg_salary;

delimiter $$
create function f_emp_avg_salary (p_emp_no integer) returns decimal (10,2)
deterministic no sql READS SQL DATA 
begin 
declare v_avg_salary decimal(10,2);
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

select f_emp_avg_salary(11300);




#Create a function called ‘emp_info’ that takes for parameters the first and last name of an employee, and returns the salary from the newest contract of that employee.

#Hint: In the BEGIN-END block of this program, you need to declare and use two variables – v_max_from_date that will be of the DATE type, and v_salary, that will be of the DECIMAL (10,2) type.

#Finally, select this function.


delimiter $$
create function emp_info (p_first_name varchar(255), p_last_name varchar(255)) returns decimal (10,2)
deterministic no sql READS SQL DATA 
begin 
declare v_salary decimal(10,2);
declare v_max_from_date date;
	SELECT 
    MAX(from_date)
INTO v_max_from_date FROM
    employees e
        JOIN
    salaries s ON e.emp_no = s.emp_no
WHERE
    e.first_name = p_first_name
        AND e.last_name = p_last_name;
    
SELECT 
    s.salary
INTO v_salary FROM
    employees e
        JOIN
    salaries s ON e.emp_no = s.emp_no
WHERE
    e.first_name = p_first_name
        AND e.last_name = p_last_name
        and s.from_date=v_max_from_date;
return v_salary;
end $$
delimiter ; 

SELECT EMP_INFO('Aruna', 'Journel');
