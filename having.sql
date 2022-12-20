--having

--1)

select isim, sum(maas) from workers group by isim having sum(maas)>=2500;

--2)

select sehir, count(sehir) from workers group by sehir having count(sehir)>1;

--3)

select sirket, min(maas) from workers group by sirket having min(maas)>2000;

--4)

select sehir, max(maas) from workers group by sehir having max(maas)<3000;







