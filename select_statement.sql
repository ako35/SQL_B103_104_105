create table workers(
id char(5),
name varchar(50),
salary int,
constraint id_pk primary key(id)
);

insert into workers values('10001', 'Ali Can', 12000);
insert into workers values('10002', 'Veli Han', 2000);
insert into workers values('10003', 'Mary Star', 7000);
insert into workers values('10004', 'Angie Ocean', 8500);

--1)
select * from workers;

--2)
select name from workers;
select name, salary from workers;

--3)
select name from workers where id='10001';

--4)
select * from workers where id='10002';

--5)
select * from workers where length(name)>8;

--6)
select * from workers order by salary desc limit 1;

--7)
select * from workers order by salary limit 1;

--8)
select name, salary from workers where salary in((select min(salary) from workers), (select max(salary) from workers));

--9)
select id from workers where salary=8500 or name='Mary Star';

--10)
select salary from workers order by salary desc offset 1 limit 1;

--11)
select salary from workers order by salary offset 1 limit 1;

--12)
select salary from workers order by salary desc offset 2 limit 1;

--13)
select * from workers order by salary desc offset 2 limit 1;

--14)
select * from workers order by salary desc offset 3 limit 1;








