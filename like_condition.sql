--like_condition

create table customers(
customer_id int unique,
customer_name varchar(50) not null,
income int
);

insert into customers(customer_id,customer_name,income) values(1001,'John',62000);
insert into customers(customer_id,customer_name,income) values(1002,'Jane',57500);
insert into customers(customer_id,customer_name,income) values(1003,'Brad',71000);
insert into customers(customer_id,customer_name,income) values(1004,'Manse',42000);

--1)
select * from customers where customer_name like 'J%';
select * from customers where customer_name like '%e';
select * from customers where customer_name like '%an%';

--2)
select * from customers where customer_name like '_ohn';
select * from customers where customer_name like '_a_e';
select * from customers where customer_name like '_r%';
select * from customers where customer_name like 'M___%';
select * from customers where customer_name like 'B%d';

create table words(
word_id int unique,
word varchar(50) not null,
number_of_letters int
);

insert into words values(1001,'hot',3);
insert into words values(1002,'hat',3);
insert into words values(1003,'hit',3);
insert into words values(1004,'hbt',3);
insert into words values(1008,'hct',3);
insert into words values(1005,'adem',4);
insert into words values(1006,'selena',6);
insert into words values(1007,'yusuf',5);

--3)
select * from words where word ~ 'h[oa]t';
select * from words where word ~ 'h[o|a]t';

select * from words where word ~ 'h[a-c]t';
select * from words where word ~ 'h[a|b|c]t';

select * from words where word ~ '[au]';

select * from words where word ~ '^[asy]';

select * from words where word ~ '[f]$';

select * from words where word ~ 'a';

select * from words where word ~ '[ai]';

select * from words where word ~ 'at';

select * from words where word ~ '[a-i]d';

select * from words where word ~ '[a-i].[e]';

select * from words where word ~ '[a-i]..[m]';

select * from words where word ~ '[e{2}]';

--not like

select * from words where word not like 'h%';

select * from words where word not like '%t';

select * from words where word not like '%a%';

select * from words where word not like '_us%';

select * from words where word !~ '[_ead]';









