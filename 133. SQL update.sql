
use employees;
update employees
set  first_name='stella',last_name='park', birth_date='1990-12-31',gender='F' where emp_no=999901;
select * from employees where emp_no=999901;

select * from department_dup order by dept_no;

commit; 

update department_dup
set dept_no='d011', dept_name='qualityy control';

rollback; 
commit;

select * from departments;
update departments
set dept_name='Data Analysis' where dept_no='d010';
rollback;


delete from departments where dept_no='d010' ;
select * from departments;


