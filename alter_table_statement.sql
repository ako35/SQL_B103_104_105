--alter_table_statement

select * from employees;

drop table if exists employees;

create table employees(
id int,
name varchar(50),
state varchar(50),
salary int,
company varchar(20)
);

insert into employees values(123456789,'john walker','florida',2500,'ibm');
insert into employees values(234567890,'brad pitt','florida',1500,'apple');
insert into employees values(345678901,'eddie murphy','texas',3000,'ibm');
insert into employees values(456789012,'eddie murphy','virginia',1000,'google');
insert into employees values(567890123,'eddie murphy','texas',7000,'microsoft');
insert into employees values(456789012,'brad pitt','texas',1500,'google');
insert into employees values(123456710,'mark stone','pennsylvania',2500,'ibm');

select * from employees1;

--1) add
alter table employees add country_name varchar(20) default 'usa';

--2) multi adds
alter table employees add gender varchar(6), add age int;

--3) drop
alter table employees drop column age;

--4) rename column
alter table employees rename column company to company_name;

--5) rename table
alter table employees rename to employees1;

--6) type column
alter table employees1 alter column state type varchar(70);

--7) multi type columns
alter table employees1 alter column state type varchar(60), alter column name type varchar(60);













