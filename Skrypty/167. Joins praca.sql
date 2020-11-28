select * from dept_manager_dup order by dept_no;
select * from department_dup order by dept_no;

SELECT  #jak odpalimy z duplikatami to mnozymy np 2x duplikat x 4 rekordy z innej tabeli
    m.dept_no, m.emp_no, d.dept_name #co wyswietlamy
FROM
    dept_manager_dup m #jaka tabele
        INNER JOIN #lub samo join
    department_dup d ON m.dept_no = d.dept_no #z czym laczymy po jakiej kolumnie 
group by m.emp_no #to dopisujemy jak nie chcemy uwzgledniac zduplikowanych wartosci
ORDER BY m.dept_no; #nie wyswietli nam takich wartosci ktorych nie ma w niektorych tabelach n[
#w jednej tab nie ma dep_no, 26-4=22 , w drugiej tab nie ma tez dep_no -1, w jednej tabeli sa wartosci 
#dep_no ale nie mamy z czym je polaczyc d001, wiec ich nie wyswietlimy -1, 
# mamy dept_no (d010, d011) ale nie mamy z czym je polaczyc -2
#czyli wyrzucamy te co nie maja sensu, jesli nie byloby polaczoenia to wynik bylby pusty (dwa zbiory rozlaczne)


SELECT 
    e.emp_no, e.first_name, e.last_name, dm.dept_no, e.hire_date
FROM
    employees e
        JOIN
    dept_manager dm ON e.emp_no = dm.emp_no;#nie waazne w jakiej kolejnosci


select * from dept_manager_dup order by dept_no ASC;
select * from department_dup order by dept_no ASC;



insert into dept_manager_dup
values ('110228','d003','1992-03-21','9999-01-01');
insert into department_dup
values ('d009','Customer Service');









