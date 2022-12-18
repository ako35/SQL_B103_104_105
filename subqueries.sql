--subqueries

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

create table companies(
company_id int,
company varchar(20),
number_of_employees int
);

insert into companies values(100,'IBM',12000);
insert into companies values(101,'GOOGLE',18000);
insert into companies values(102,'MICROSOFT',10000);
insert into companies values(100,'APPLE',21000);

--find the employee and company names whose company has more than 15000 employees

select name, company from employees where company in(select company from companies where number_of_employees>15000);

--find the company number of employees and average salary for every company

select company, number_of_employees, (select avg(salary) from employees where companies.company=employees.company) from companies;

select company, avg(salary) from employees group by company;

select company,number_of_employees,(select avg(salary) from employees group by company having companies.company=employees.company) from companies 

--find the name of the companies, company ids, and the number of states for every company

select company, company_id, (select count(state) from employees group by company having companies.company=employees.company) from companies

select company, company_id, (select avg(state) from employees where companies.company=employees.company) from companies;

--find the name of the companies, company ids, maximum and minimum salaries per company

select company, company_id, (select max(salary) from employees where companies.company=employees.company), (select min(salary) from employees where companies.company=employees.company) from companies;

select company, company_id, (select max(salary) from employees group by company having companies.company=employees.company), (select min(salary) from employees group by company having companies.company=employees.company) from companies



