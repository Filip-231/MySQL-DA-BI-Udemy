
USE Sales;

CREATE TABLE sales (
    purchase_number INT AUTO_INCREMENT,
    date_of_purchase DATE NOT NULL,
    customer_id INT,
    item_code VARCHAR(10) NOT NULL,
    PRIMARY KEY (purchase_number)
);


ALTER TABLE sales
ADD FOREIGN KEY (customer_id) REFERENCES customers(customer_id) on delete cascade;

ALTER TABLE sales
DROP FOREIGN KEY sales_ibfk_1;

drop table customers;

CREATE TABLE customers (
    customer_id INT AUTO_INCREMENT,
    first_name VARCHAR(255),
    last_name VARCHAR(255),
    email_adress VARCHAR(255),
    number_of_complaints INT DEFAULT 0,
    PRIMARY KEY (customer_id)
);

drop table companies;

CREATE TABLE companies (
    company_id INT AUTO_INCREMENT,
    headquarters_phone_number VARCHAR(255),
    company_name VARCHAR(255) NOT NULL,
    PRIMARY KEY (company_id)
);

alter table companies
modify company_name varchar(255) null; 

alter table companies
change column company_name company_name varchar(255) not null; 

insert into companies (headquarters_phone_number,company_name)
values ('+1 (202) 555-0196','Company A')
;


alter table customers
add unique key (email_adress); 

alter table customers 
drop index email_adress; 

alter table customers
add column gender enum('M','F') after last_name;


insert into customers (first_name, last_name, gender, email_adress,number_of_complaints)
values ('John','Mackinley','M','john.mckinley@365careers.com',0)
;

alter table customers
change column number_of_complaints number_of_complaints int default 0; 

insert into customers (first_name, last_name, gender)
values ('Peter','Figaro','M') 
;


alter table customers
alter column number_of_complaints drop default;



CREATE TABLE items (
    item_code VARCHAR(255),
    item VARCHAR(255),
    unit_price NUMERIC(10 , 2 ),
    company_id VARCHAR(255),
    PRIMARY KEY (item_code)
);


CREATE TABLE companies
(
	company_id VARCHAR(255),
    company_name VARCHAR(255),
    headquarters_phone_number INT(12),
primary key (company_id)
)


DROP table sales;
drop table customers;
drop table items;
drop table companies;
