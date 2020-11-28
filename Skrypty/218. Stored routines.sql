use employees;
drop procedure if exists select_employees;


delimiter $$
create procedure select_employess ()
begin #klikajac na kwadrat mozna ukryc kod
	select * from employees 
    limit 1000;
end $$
delimiter ; #problemy z tymi przecinkami podczas wywolywania wielu procedur

call employees.select_employess();

call select_employess();



#Create a procedure that will provide the average salary of all employees.#
DELIMITER $$

CREATE PROCEDURE avg_salary()

BEGIN

                SELECT

                                AVG(salary)

                FROM

                                salaries;

END$$

DELIMITER ;

CALL avg_salary;

CALL avg_salary();

CALL employees.avg_salary;

CALL employees.avg_salary();


#225 zaawansowane procedury
delimiter $$
create procedure emp_salary (in p_emp_no integer)
begin 
	select * from employees e 
    join salaries s on e.emp_no =s.emp_no
    where e.emp_no=p_emp_no;
end $$
delimiter ; 
#potem mozemy odpalic i podac numer jakiegos klienta np 11030


delimiter $$
create procedure emp_avg_salary (in p_emp_no integer)
begin 
	select e.first_name, avg(s.salary) from employees e 
    join salaries s on e.emp_no =s.emp_no
    where e.emp_no=p_emp_no;
end $$
delimiter ; 


call emp_avg_salary(11300);


#in i out parameter 
delimiter $$
create procedure emp_avg_salary_out (in p_emp_no integer , out p_avg_salary decimal(10,2))
begin 
	select avg(s.salary) into p_avg_salary
    from employees e 
    join salaries s on e.emp_no =s.emp_no
    where e.emp_no=p_emp_no;
end $$
delimiter ; 

#Create a procedure called ‘emp_info’ that uses as parameters the first and the last name of an individual, and returns their employee number.
delimiter $$
create procedure emp_info (in p_emp_no integer)
begin 
	select first_name
    from employees e 
    where e.emp_no=p_emp_no;
end $$
delimiter ; 
call emp_info(11030);

DELIMITER $$

CREATE PROCEDURE emp_info2(in p_first_name varchar(255), in p_last_name varchar(255), out p_emp_no integer)

BEGIN

                SELECT

                                e.emp_no

                INTO p_emp_no FROM

                                employees e

                WHERE

                                e.first_name = p_first_name

                                                AND e.last_name = p_last_name;

END$$

DELIMITER ;


select * from employees;