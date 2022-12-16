create table public.customer
(
id integer not null,
name text collate pg_catalog."default" not null,
age integer not null,
salary real not null
)

create table orders(
order_id integer not null,
date date not null,
cust_id integer not null,
amount real not null,
constraint "order_pkey" primary key ("order_id")
)

insert into customer(id, name, age, salary) values(101, 'John', 24, 20000)
insert into customer(id, name, age, salary) values(102, 'Mike', 22, 25000)
insert into customer(id, name, age, salary) values(103, 'Emily', 24, 22000)
insert into customer(id, name, age, salary) values(104, 'James', 20, 30000)
insert into customer(id, name, age, salary) values(105, 'Sophia', 21, 35000)

insert into orders(order_id, date, cust_id, amount) values(1, '2009-10-08', 103, 1500)
insert into orders(order_id, date, cust_id, amount) values(2, '2009-11-06', 103, 1000)
insert into orders(order_id, date, cust_id, amount) values(3, '2009-12-05', 102, 2500)
insert into orders(order_id, date, cust_id, amount) values(4, '2009-09-08', 101, 1800)

select * from customer;

select * from orders;

select id, name, amount, date from customer left join orders on customer.id=orders.order_id
except
select id, name, amount, date from customer right join orders on customer.id=orders.order_id order by name;


select id, name, age, salary from customer
except
select id, name, age, salary from customer where age>21;









