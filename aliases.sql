--aliases

drop table if exists employees;

create table employees(
employee_id int,
employee_first_name varchar(20),
employee_last_name varchar(20)
);

insert into employees values(14,'Chris','Tae');
insert into employees values(11,'John','Walker');
insert into employees values(12,'Amy','Star');
insert into employees values(13,'Brad','Pitt');
insert into employees values(15,'Chris','Way');

--1)
select employee_id as id, employee_first_name as first_name, employee_last_name as last_name from employees;

--2)
select employee_id as id, employee_first_name || employee_last_name as full_name from employees;

create table addresses(
employee_id int,
street varchar(20),
city varchar(20),
state char(2),
zipcode char(5)
);

insert into addresses values(11,'32nd Star 1234','Miami','FL','33018');
insert into addresses values(12,'23rd Rain 567','Jacksonville','FL','32256');
insert into addresses values(13,'5th Snow 765','Hialeah','VA','20121');
insert into addresses values(14,'3nd Man 12','Weston','MI','12345');
insert into addresses values(15,'11nd Chris 12','St. Johns','FL','32259');

--3)
select e.employee_first_name,e.employee_last_name,a.city from employees e, addresses a where e.employee_id=a.employee_id;










