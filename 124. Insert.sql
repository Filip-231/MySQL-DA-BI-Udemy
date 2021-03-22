select * from employees order by emp_no desc limit 10;

insert into employees 
(
	emp_no,
    birth_date,
    first_name, #mozna w roznej kolejnosci
    last_name,
    gender,
    hire_date
)values
(	999901,
	'1999-03-21',#jak damy date 9999 to kontrakt sie nie skonczy
    'John',
    'Smith',
    'M',
    '1991-02-21' 
)

insert into employees 
values
(	999903,
	'1999-03-21',
    'Johnatan',
    'greek',
    'M',
    '1991-02-21'
);

create table department_dup
(
	dept_no char(4) not null,
    dept_name varchar(40) not null
);
 
 insert into department_dup
 (dept_no,dept_name) select * from departments;

select * from department_dup;
insert into departments values ('d010', 'Buisness Analysis');