drop table if exists students;

create table students(
id int,
name varchar(20),
state varchar(20),
gpa real
);

insert into students values(123456789,'John Walker','Texas',2.8);
insert into students values(234567890,'Eddie Murphy','Florida',3.2);
insert into students values(345678901,'Adam Eve','New York',3.5);
insert into students values(456789012,'Alex Tien','New York',3.8);
insert into students values(567890123,'Chris Matala','Virginia',4);

--a)
select * from students;

--b)
select * from students where gpa>3.1 or state='Texas';

--c)
select name from students where gpa<3.5 or state='Florida';

--d)
select name, id from students where gpa between 2.8 and 3.5;

--e)
select * from students where (state='New York') and (gpa between 3.3 and 3.7);

--f)
select * from students where (state='New York') and (gpa not between 3.3 and 3.7);












