#------------------------------------tableau 261
#Create a visualization that provides a breakdown between the male and female employees working in the company each year, starting from 1990. 


select 
emp_no, from_date, to_date
from 
t_dept_emp;
select distinct 
emp_no, from_date ,to_date
from t_dept_emp
;

SELECT 

    YEAR(d.from_date) AS calendar_year,
    e.gender,    
    COUNT(e.emp_no) AS num_of_employees

FROM     
     t_employees e         
          JOIN    
     t_dept_emp d ON d.emp_no = e.emp_no

GROUP BY calendar_year , e.gender 

HAVING calendar_year >= 1990;


##############269 task 2########

#Compare the number of male managers to the number of female managers from different departments for each year, starting from 1990.


select d.dept_name, ee.gender , dm.emp_no, dm.from_date , dm.to_date ,e.calendar_year ,
case when year(dm.to_date)>= e.calendar_year and year(dm.from_date)<= e.calendar_year then 1
else 0
end as active
from (select 
year (hire_date) as calendar_year
from t_employees
group by calendar_year) e
cross join 
t_dept_manager dm
join 
t_departments d on dm.dept_no=d.dept_no
join 
t_employees ee on dm.emp_no = ee.emp_no
order by dm.emp_no, calendar_year;

#zobaczmy sobie co my wgl tu mamy
select * from 
(select 
year (hire_date) as calendar_year
from t_employees
group by calendar_year) e
cross join 
t_dept_manager dm
join 
t_departments d on dm.dept_no=d.dept_no
join 
t_employees ee on dm.emp_no = ee.emp_no
order by dm.emp_no, calendar_year;


#############################################task 3 ########################

#Compare the average salary of female versus male employees in the entire company until year 2002, and add a filter allowing you to see that per each department.

SELECT 
    e.gender,
    d.dept_name,
    ROUND(AVG(s.salary), 2) AS salary,
    YEAR(s.from_date) AS calendar_year
FROM
    t_salaries s
        JOIN
    t_employees e ON s.emp_no = e.emp_no
        JOIN
    t_dept_emp de ON de.emp_no = e.emp_no
        JOIN
    t_departments d ON d.dept_no = de.dept_no
GROUP BY d.dept_no , e.gender , calendar_year
HAVING calendar_year <= 2002
ORDER BY d.dept_no;





#--------------------------task4----------------------------------
#Create an SQL stored procedure that will allow you to obtain the average male and female salary per department within a certain salary range. Let this range be defined by two values the user can insert when calling the procedure.

#Finally, visualize the obtained result-set in Tableau as a double bar chart. 


DROP PROCEDURE IF EXISTS filter_salary;

DELIMITER $$
CREATE PROCEDURE filter_salary (IN p_min_salary FLOAT, IN p_max_salary FLOAT)
BEGIN
SELECT 
    e.gender, d.dept_name, AVG(s.salary) as avg_salary
FROM
    t_salaries s
        JOIN
    t_employees e ON s.emp_no = e.emp_no
        JOIN
    t_dept_emp de ON de.emp_no = e.emp_no
        JOIN
    t_departments d ON d.dept_no = de.dept_no
    WHERE s.salary BETWEEN p_min_salary AND p_max_salary
GROUP BY d.dept_no, e.gender;
END$$

DELIMITER ;

CALL filter_salary(50000, 90000);