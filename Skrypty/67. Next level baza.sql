select first_name, last_name from employees;
select * from employees;
select dept_no from departments;

select * from employees where first_name='Denis' and (gender='M' or gender='F');
/*operatory:
and- dwa warunki
or- lub
operator and łaczy lepiej niz or
like
in not in
*/
select * from employees where first_name='Cathie' or first_name='Mark' or first_name='Nathan';
select * from employees where first_name IN ('Cathie', 'Mark', 'Nathan'); #szybszy operator
select * from employees where first_name NOT IN ('Cathie', 'Mark', 'Nathan'); #szybszy operator

#pattern
select * from employees where first_name LIKE ('%ar%');
select * from employees where first_name LIKE ('Mar_'); #ile liter
select * from employees where first_name NOT LIKE ('%Mar%'); #nie ma znaczenia wielkosc liter
select * from employees where hire_date like ('2000%');
select * from employees where emp_no LIKE ('1000%') and emp_no like('_____');

#bettween and mozna stosowac tez na liczbach i stringach
select * from employees where hire_date between '1990-01-01' and '2000-01-01'; #zawiera obie daty
select * from employees where hire_date not between '1990-01-01' and '2000-01-01'; #nie zawiera obie daty

#not null
select * from employees where first_name is not null; 
select * from employees where first_name is null; 

#not equal <>
select * from employees where first_name != 'Mark'; 
select * from employees where hire_date >= '2000-01-01';

# wybierz unikalne
select distinct gender from employees;

# funkcje count sum min max avg
select count(emp_no) from employees; #liczy ile mamy rekordow
select count(distinsalariesct first_name) from employees; #liczy ile mamy unikalnych rekordow

select count(emp_no) from salaries where salary >= 100000;
select count(*) from dept_manager;

#order by
select * from employees order by first_name ASC; #porzadek rosnacy ale nie trzeba pisac asc
select * from  employees order by first_name DESC;
select * from  employees order by first_name, last_name ASC; #biore pod uwage tez nazwisko

#group by
select first_name from employees group by first_name; #grupuje podobne jak distinc
select first_name, count(first_name) from employees group by first_name; # wazne zeby pisac tez zmiennawystepowanie imion
select first_name, count(first_name) from employees group by first_name order by first_name desc;

#aliasy nazwy
select first_name, count(first_name) as names_count from employees group by first_name order by first_name;

select salary, count(emp_no) as empwithsameslaary from salaries where salary>80000 group by salary order by salary;

#having odnosi sie do klauzuli gruopu
select * from employees having hire_date >= '2000-01-01';

SELECT 
    first_name, COUNT(first_name) AS names_count
FROM
    employees
GROUP BY first_name
HAVING COUNT(first_name) > 250 #odnosimy sie do funkcji agregujacej count wiec dajemy po gruopu havin
ORDER BY first_name;

#zadanie
SELECT 
    *, AVG(salary)
FROM
    salaries
GROUP BY emp_no
HAVING AVG(salary) > 120000;
ORDER BY emp_no;

 





















 






