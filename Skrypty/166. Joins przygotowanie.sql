#wstep
select * from department_dup;

alter table department_dup
change column dept_no dept_no char(4) null;

ALTER TABLE department_dup
CHANGE COLUMN dept_name dept_name VARCHAR(40) NULL;

DROP TABLE IF EXISTS dept_manager_dup;

CREATE TABLE dept_manager_dup (

  emp_no int(11) NOT NULL,

  dept_no char(4) NULL,

  from_date date NOT NULL,

  to_date date NULL

  );

 

INSERT INTO dept_manager_dup

select * from dept_manager;

 

INSERT INTO dept_manager_dup (emp_no, from_date)

VALUES                (999904, '2017-01-01'),

                                (999905, '2017-01-01'),

                               (999906, '2017-01-01'),

                               (999907, '2017-01-01');

 

DELETE FROM dept_manager_dup

WHERE

    dept_no = 'd001';

INSERT INTO department_dup (dept_name)

VALUES                ('Public Relations');

 

DELETE FROM department_dup

WHERE

    dept_no = 'd002';

#praca
