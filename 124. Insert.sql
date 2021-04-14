SELECT 
    *
FROM
    employees
ORDER BY emp_no DESC
LIMIT 10;



insert into employees 
(
	emp_no,
    birth_date,
    first_name, 
    last_name,
    gender,
    hire_date
)values
(	999901,
	'1999-03-21', #if date 9999 then no end
    'John',
    'Smith',
    'M',
    '1991-02-21' 
);

insert into employees 
values
(	999903,
	'1999-03-21',
    'Johnatan',
    'greek',
    'M',
    '1991-02-21'
);

CREATE TABLE department_dup (
    dept_no CHAR(4) NOT NULL,
    dept_name VARCHAR(40) NOT NULL
);
 
 insert into department_dup
 (dept_no,dept_name) select * from departments;

SELECT 
    *
FROM
    department_dup;
insert into departments values ('d010', 'Buisness Analysis');