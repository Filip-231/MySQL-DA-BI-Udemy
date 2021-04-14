select first_name, last_name from employees;
select * from employees;
select dept_no from departments;


select * from employees where first_name='Denis' and (gender='M' or gender='F');
select * from employees where first_name='Cathie' or first_name='Mark' or first_name='Nathan';
select * from employees where first_name IN ('Cathie', 'Mark', 'Nathan'); #szybszy operator
select * from employees where first_name NOT IN ('Cathie', 'Mark', 'Nathan'); #szybszy operator
select * from employees where first_name LIKE ('%ar%');
select * from employees where first_name LIKE ('Mar_'); #ile liter
select * from employees where first_name NOT LIKE ('%Mar%'); #nie ma znaczenia wielkosc liter
select * from employees where hire_date like ('2000%');
select * from employees where emp_no LIKE ('1000%') and emp_no like('_____');
select * from employees where hire_date between '1990-01-01' and '2000-01-01'; 
select * from employees where hire_date not between '1990-01-01' and '2000-01-01'; 
select * from employees where first_name is not null; 
select * from employees where first_name is null; 
select * from employees where first_name != 'Mark'; 
select * from employees where hire_date >= '2000-01-01';



select distinct gender from employees;
select count(emp_no) from employees;
select count(distinct first_name) from employees; 
select count(emp_no) from salaries where salary >= 100000;
select count(*) from dept_manager;


select * from employees order by first_name ASC; 
select * from  employees order by first_name DESC;
select * from  employees order by first_name, last_name ASC; 


select first_name from employees group by first_name; 
select first_name, count(first_name) from employees 
	group by first_name order by first_name desc;
	
select first_name, count(first_name) as names_count 
from employees group by first_name order by first_name;

select salary, count(emp_no) as empwithsameslaary from salaries 
where salary>80000 group by salary order by salary;

select * from employees having hire_date >= '2000-01-01';




