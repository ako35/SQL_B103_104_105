--exists_condition

--exists kosulu alt sorgularla birlikte kullanilir.

--alt sorgu en az bir satir dondururse karsilanmasi kabul edilir.

create table customers_products(
product_id int,
customer_name varchar(50),
product_name varchar(50)
);

insert into customers_products values(10,'Mark','Orange');
insert into customers_products values(10,'Mark','Orange');
insert into customers_products values(20,'John','Apple');
insert into customers_products values(30,'Amy','Palm');
insert into customers_products values(20,'Mark','Apple');
insert into customers_products values(10,'Adem','Orange');
insert into customers_products values(40,'John','Apricot');
insert into customers_products values(20,'Eddie','Apple');

create table customers_likes(
product_id int,
customer_name varchar(50),
liked_product varchar(50)
);

insert into customers_likes values(10,'Mark','Orange');
insert into customers_likes values(50,'Mark','Pineapple');
insert into customers_likes values(60,'John','Avocado');
insert into customers_likes values(30,'Lary','Cherries');
insert into customers_likes values(20,'Mark','Apple');
insert into customers_likes values(10,'Adem','Orange');
insert into customers_likes values(40,'John','Apricot');
insert into customers_likes values(20,'Eddie','Apple');

select customer_name from customers_products p where exists(select product_id from customers_likes l where p.product_id=l.product_id);

select customer_name from customers_products p where exists(select customer_name from customers_likes l where p.product_id=l.product_id);

select customer_name from customers_products p where exists(select liked_product from customers_likes l where p.product_id=l.product_id);

-- uc kod da ayni sonucu verir cunku exists komutunun calismasi icin icerisinde ne dondugunun ve kac tane dondugunun bir onemi yoktur.
-- exists komutunun calismasi icin icindeki sub query nin bir tane sonuc dondurmesi yeterlidir.


