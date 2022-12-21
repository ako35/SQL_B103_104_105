sql_technical_interview_questions
--students
select * from students;

create table employees(
id int,
name varchar(50),
state varchar(50),
salary int,
company varchar(20)
);

insert into employees values(123456789,'John Walker','Florida',2500,'IBM');
insert into employees values(234567890,'Brad Pitt','Florida',1500,'APPLE');
insert into employees values(345678901,'Eddie Murphy','Texas',3000,'IBM');
insert into employees values(456789012,'Eddie Murphy','Virginia',1000,'GOOGLE');
insert into employees values(567890123,'Eddie Murphy','Texas',7000,'MICROSOFT');
insert into employees values(456789012,'Brad Pitt','Texas',1500,'GOOGLE');
insert into employees values(123456710,'Mark Stone','Pennsylvania',2500,'IBM');

select * from employees;

--1) 
select id, name from students
intersect
select id, name from employees;

select name from students
intersect
select name from employees;

--2) 
select distinct state from employees;

--3) 
select * from students where id%2=0;

select * from students where id%2=1;

--4)
select count(*) from students;

--5) 
select max(salary) from students;

select salary from students order by salary desc limit 1;

--6)
select * from students order by salary desc limit 1;

select * from students where salary=(select max(salary) from students);

--7)
select salary from students order by salary desc offset 1 limit 1;

select salary from students where salary=(select max(salary) from students where salary<(select max(salary) from students));

--8) 
select * from students order by salary desc offset 1 limit 1;

select * from students where salary=(select max(salary) from students where salary<(select max(salary) from students));

--9)
select name,upper(state) from students;

--10)
select name, lower(state) from students;

--11)
select name, initcap(company) from students;











