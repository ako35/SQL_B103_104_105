create table people(
ssn int,
name varchar(50),
address varchar(50)
);

insert into people values(123456789, 'Mark Star', 'Florida');
insert into people values(234567890, 'Angie Way', 'Virginia');
insert into people values(345678901, 'Marry Tien', 'New Jersey');

update people set address='Pennsylvania' where address='Virginia';

select * from people;

delete from people where name='Marry Tien';






