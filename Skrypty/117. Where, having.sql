#nazwy ludzi ktore wystepuja wiecej niz 200 , z danych ludzi zatrudnionych po 1st
SELECT 
    first_name, COUNT(first_name) AS names_count
FROM
    employees
WHERE
    hire_date > '1999-01-01' #odnosi sie do nie zaagregowanego
GROUP BY first_name
HAVING COUNT(first_name) < 200 #nie mieszaj tutaj warunkow, jest to po agregacji, nie dodawaj tu np and hire data
ORDER BY first_name DESC;

select * from dept_emp;
#wybierz emp no , ludzi ktorzy podpisali wiecej niz 1 kontrakt po 1 01 2000
select emp_no, count(from_date)
from dept_emp
where from_date >'2000-01-01'
group by emp_no
having count(from_date)>1
order by emp_no;

################# 121 limit ##################
#10 najlepiej zarabiających 
select * from salaries
order by salary desc 
limit 10;




