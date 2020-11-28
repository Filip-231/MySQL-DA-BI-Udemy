#Cwiczenia MYSQL 365 udemy.com od zadania 25, 26-05-2020

#select * from employees;
#CREATE DATABASE [IF NOT EXISTS] database_name
#tworzenie bazy danych 
#ctr shift enter - exekucja

#create database if not exists Sales;
#CREATE SCHEMA IF NOT EXISTS Sales; #to samo co powyżej


#varchar(5)# okresla maxymalnny rozmiar przrchowywanych danych
#char(3) #okresla dokladny rozmiar stringa jest szybszy do przegladania
#ENUM 
#integers :int, tinyint, bigint sa ustawiane domyslnie

#precision ilosc liczb
#scale ilosc po przecinku
#DECIMAL(5,3) #10,543
#sql zaookragla zeby pasowały
#NUMERIC to samo ale bez ostrzezen?

#DATE
#DATE+TIME=DATTIME
#YYYY-MM-DD HH:MM:SS[.fraction]
#TIMESTAMP #idealnie ustawiony moment w czasie
#'2018-07-25 10:30:00' UTC #mozna na nich dzialac,uwzglednia stefe 
#BLOB #binary large object .doc .xlsx .jpeg

#USE Sales; #uzywamy bazy sales

#CREATE TABLE table_name ( 
	#column1 datatype constraints,

	#columnn datatype constraints
#); #musi zawierac jakas kolumne



drop table sales;
CREATE TABLE sales
(
	#purchase_number INT NOT NULL PRIMARY KEY auto_increment, #auto_increment zwiekszamy co 1 o kazda linie
	purchase_number INT auto_increment,
    date_of_purchase DATE NOT NULL,
	customer_id INT,
    item_code VARCHAR(10) NOT NULL,
PRIMARY KEY (purchase_number)
#FOREIGN KEY(customer_id) REFERENCES customers(customer_id) ON DELETE CASCADE
#jesli usuniemy klienta to wtedy usunie sie z tej tabeli wszystkie jego sprzedaze
);

#tworzenie foregin key
ALTER TABLE sales
ADD FOREIGN KEY (customer_id) REFERENCES customers(customer_id) on delete cascade;

#usuwanie zdalnie foregin key
ALTER TABLE sales
DROP FOREIGN KEY sales_ibfk_1;


use sales;
drop table customers;

CREATE TABLE customers
(
	customer_id INT auto_increment,
	first_name VARCHAR(255),
    last_name VARCHAR(255),
    email_adress VARCHAR(255),
    number_of_complaints INT DEFAULT 0, #wartosc domyslna 0 moze byc np varchar(255) default 'X'
primary key (customer_id)
#unique key (email_adress)
);

drop table companies
create table companies
(
	company_id int auto_increment,
    headquarters_phone_number varchar(255),
    company_name varchar(255) not null,
primary key(company_id)
);
alter table companies
modify company_name varchar(255) null; #ustawienie na zero 

alter table companies
change column company_name company_name varchar(255) not null; #zmiana na nie zero

insert into companies (headquarters_phone_number,company_name)
values ('+1 (202) 555-0196','Company A')
;

select * from companies




alter table customers
add unique key (email_adress);  #dodajemy ograniczenie

alter table customers 
drop index email_adress; #usuwamy ograniczenie

alter table customers
add column gender enum('M','F') after last_name;


insert into customers (first_name, last_name, gender, email_adress,number_of_complaints)
values ('John','Mackinley','M','john.mckinley@365careers.com',0)
;


alter table customers
change column number_of_complaints number_of_complaints int default 0; #ustawiamy domyslne

insert into customers (first_name, last_name, gender)
values ('Peter','Figaro','M') # nie musimy dodawac wszystkich informacji
;

#select * from customers; 

alter table customers
alter column number_of_complaints drop default; #porzucanie wartosci domyslnej












#drop table customers
#drop table items;
#drop table companies;

CREATE TABLE items
(
	item_code VARCHAR(255),
    item VARCHAR(255),
    unit_price NUMERIC(10,2),
    company_id VARCHAR(255),
primary key (item_code)
);


CREATE TAble companies
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


