#left join wszystkie wartosci ze zbioru tylko A plus iloraz A B
delete from dept_manager_dup
where emp_no='110228';
delete from department_dup
where dept_no='d009';
insert into dept_manager_dup
values ('110228','d003','1992-03-21','9999-01-01');
insert into department_dup
values ('d009','Customer Service');
#usuwamy duplikaty i dodajemy zeby bylo jedno

SELECT 
    m.dept_no, m.emp_no, d.dept_name
FROM
    dept_manager_dup m
        LEFT JOIN
    department_dup d ON m.dept_no = d.dept_no
GROUP BY m.emp_no
ORDER BY m.dept_no;  #+6 rekordow reprezentuje zbior A bez B


SELECT 
    d.dept_no, m.emp_no, d.dept_name
FROM
    department_dup d
        LEFT JOIN #to samo co left outter join
    dept_manager_dup m ON m.dept_no = d.dept_no
where dept_name is null
ORDER BY d.dept_no;  #zmienamy kolejnosc

#zadanie left join
select e.emp_no, e.first_name, e.last_name, d.dept_no, d.from_date
from employees e
	left join
    dept_manager d on e.emp_no= d.emp_no
    where last_name='Markovitch'
    order by dept_no DESC, e.emp_no;
    
    
select * from employees;
select * from dept_manager;

#right join
# lefft join i right join z odwroconymi tablicami da te same wyniki

