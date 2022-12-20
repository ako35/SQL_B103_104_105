--union_operatoru

--1)

select sehir, maas from workers where maas>3000
union
select isim, maas from workers where maas<2000;

--union all operatoru

--1)

select sehir, maas from workers where maas>3000
union all
select isim, maas from workers where maas<2000;

--intersect 

--1)

select isim from workers where maas<2000
intersect
select isim from workers where maas>1000;

--2)

select isim from workers where maas>2000
intersect 
select isim from workers where sirket in('IBM','APPLE','GOOGLE');

--except operator

--1)

select isim from workers where maas<2000
except
select isim from workers where maas>1000;

--2)

select isim, sirket, maas from workers where maas<3000
except
select isim, sirket, maas from workers where sirket in('GOOGLE');





