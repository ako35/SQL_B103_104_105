--joins

--1) inner join

alter table companies rename to my_companies;

select * from my_companies;

select c.company_name, o.order_id, o.order_date from my_companies c inner join orders o on c.company_id=o.company_id;

--2) left join

alter table my_companies rename to companies;

select * from companies;

select c.company_name, o.order_id, o.order_date from companies c left join orders o on c.company_id=o.company_id;

--3) right join

select c.company_name, o.order_id, o.order_date from companies c right join orders o on c.company_id=o.company_id;

--4) full join

select c.company_name, o.order_id, o.order_date from companies c full join orders o on c.company_id=o.company_id;

--5) self join

select * from workers;
drop table if exists workers;

create table workers(
id int,
name varchar(20),
title varchar(60),
manager_id int
);

insert into workers values(1,'Ali Can','SDET',2);
insert into workers values(2,'John Walker','QA',3);
insert into workers values(3,'Angie Star','QA Lead',4);
insert into workers values(4,'Amy Sky','CEO',5);

select w1.name, w2.name from workers w1 inner join workers w2 on w1.manager_id=w2.id;






