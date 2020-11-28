SELECT 
    m.dept_no, m.emp_no, d.dept_name
FROM
    dept_manager_dup m,
    department_dup d
where m.dept_no=d.dept_no #taki sam rezultat jak join ale wiecej czasu
ORDER BY m.dept_no; 

SELECT 
    e.emp_no, e.first_name, e.last_name, s.salary
FROM
    employees e
        JOIN
    salaries s ON e.emp_no = s.emp_no
WHERE
    s.salary > 145000;
#jakis tam blad 
set @@global.sql_mode := replace(@@global.sql_mode, 'ONLY_FULL_GROUP_BY', '');
    
SELECT 
    e.first_name, e.last_name, e.hire_date, s.title
FROM
    employees e
        JOIN
     titles s ON e.emp_no = s.emp_no
WHERE
    e.first_name = 'Margareta' and e.last_name='Markovitch'
order by e.emp_no;

#cross  join laczenie krzyzowe bez warunku
select dm.*, d.*
from dept_manager dm
cross join departments d
order by dm.emp_no, d.dept_no;

select e.*, d.*
from departments d
cross join dept_manager dm
join employees e on dm.emp_no=e.emp_no
where d.dept_no <> dm.dept_no #bez departamentu w ktorych manager pracuje
order by dm.emp_no, d.dept_no;


#Use a CROSS JOIN to return a list with all possible combinations between managers from the dept_manager table and department number 9.
select dm.*, d.*
from departments d
cross join dept_manager dm
where d.dept_no = 'd009'
order by d.dept_name;

#Return a list with the first 10 employees with all the departments they can be assigned to.
select e.*, d.*
from employees e
cross join departments d
where e.emp_no <10011
order by e.emp_no;

#193
select e.gender, avg(s.salary) as average_salary #uwaga jak dodamy emp no to da nam pierwsza wartosc ze stosu
from employees e
join salaries s on e.emp_no = s.emp_no
group by gender;

#join wiecej tejbyl
select e.first_name, e.hire_Date, m.from_date, d.dept_name
from employees e
join dept_manager m on e.emp_no = m.emp_no
join departments d on m.dept_no = d.dept_no
;

#Select all managers’ first and last name, hire date, job title, start date, and department name.
SELECT 
    e.first_name,
    e.last_name,
    e.hire_date,
    t.title,
    m.from_date,
    d.dept_name
FROM
    employees e
        JOIN
    dept_manager m ON e.emp_no = m.emp_no
        JOIN
    departments d ON m.dept_no = d.dept_no
        JOIN
    titles t ON e.emp_no = t.emp_no
WHERE
    t.title = 'Manager'
ORDER BY e.emp_no;


#laczenie nie zrelacjonowanych tabel
select d.dept_name, avg(s.salary) as average_salary
from departments d
join dept_manager m on d.dept_no=m.dept_no
join salaries s on m.emp_no = s.emp_no
group by d.dept_name #jak jest tylko jedna kolumna taka to mozna d pominac
having average_salary> 60000
order by average_salary; #mozemy sortowac po nie wyswietlanych oraz po aliasach

select * from employees;
#How many male and how many female managers do we have in the ‘employees’ database?
select e.gender, count(dm.emp_no)
from employees e 
join dept_manager dm on e.emp_no=dm.emp_no
group by e.gender;

#uniony
drop table if exists employees_dup;
create table employees_dup(
emp_no int(11),
birth_date date,
first_name varchar(14),
last_name varchar(16),
gender enum('M','F'),
hire_date date);


insert into employees_dup
select e.* from employees e limit 20;
select * from employees_dup;
 
insert into employees_dup values
('10001','1953-09-02','Georgi', 'Facello', 'M' ,'1986-06-26');

#nasz unionik 
select e.emp_no, e.first_name, e.last_name, null as dept_no, null as from_date
from employees_dup e
where e.emp_no=10001
union  select null as emp_no, null as first_name, null as last_name, m.dept_no, m.from_date
from dept_manager m
;
#jak damy union all to wpierdzielimy jeszcze duplikat 

SELECT 
    *
FROM
    (SELECT 
        e.emp_no,
            e.first_name,
            e.last_name,
            NULL AS dept_no,
            NULL AS from_date
    FROM
        employees e
    WHERE
        last_name = 'Denis' UNION SELECT 
        NULL AS emp_no,
            NULL AS first_name,
            NULL AS last_name,
            dm.dept_no,
            dm.from_date
    FROM
        dept_manager dm) AS a
ORDER BY - a.emp_no DESC;


