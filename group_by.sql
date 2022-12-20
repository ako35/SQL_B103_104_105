--group_by

select * from workers;

drop table if exists workers;

alter table isciler rename to workers;

--1) find the total salary for every employee

select isim, sum(maas) from workers group by isim;

--2) find the number of employees per state

select sehir, count(sehir) from workers group by sehir;

--3) find the number of the employees whose salary is more than $2000 per company

select sirket, count(*) from workers where maas>2000 group by sirket;

--4) find the minimum and maximum salary for every company

select sirket, min(maas), max(maas) from workers group by sirket;








