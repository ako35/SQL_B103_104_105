--review_question

--1)

drop table if exists orders;

create table companies(
company_id int,
company_name varchar(20)
);

insert into companies values(100,'IBM');
insert into companies values(101,'GOOGLE');
insert into companies values(102,'MICROSOFT');
insert into companies values(103,'APPLE');

create table orders(
order_id int,
company_id int,
order_date date
);

insert into orders values(11,101,'17-APR-20');
insert into orders values(22,102,'18-APR-20');
insert into orders values(33,103,'19-APR-20');
insert into orders values(44,104,'20-APR-20');
insert into orders values(55,105,'21-APR-20');

select * from companies;
select * from orders;

select * from companies c inner join orders o on c.company_id=o.company_id;

select company_id from companies
intersect
select company_id from orders;





