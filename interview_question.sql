drop table if exists personel;

create table personel(
id int,
isim varchar(50),
sehir varchar(50),
maas int,
sirket varchar(20)
);

insert into personel values(123456789, 'Johnny Walk', 'New Hampshire', 2500, 'IBM');
insert into personel values(234567891, 'Brian Pitt', 'Florida', 1500, 'LINUX');
insert into personel values(245678901, 'Eddie Murphy', 'Texas', 3000, 'WELLS FARGO');
insert into personel values(456789012, 'Teddy Murphy', 'Virginia', 1000, 'GOOGLE');
insert into personel values(567890124, 'Eddie Murphy', 'Massachuset', 7000, 'MICROSOFT');
insert into personel values(456789012, 'Brad Pitt', 'Texas', 1500, 'TD BANK');
insert into personel values(123456719, 'Adam Stone', 'New Jersey', 2500, 'IBM');

create table isciler(
id int,
isim varchar(50),
sehir varchar(50),
maas int,
sirket varchar(20)
);

insert into isciler values(123456789, 'John Walker', 'Florida', 2500, 'IBM');
insert into isciler values(234567890, 'Brad Pitt', 'Florida', 1500, 'APPLE');
insert into isciler values(345678901, 'Eddie Murphy', 'Texas', 3000, 'IBM');
insert into isciler values(456789012, 'Eddie Murphy', 'Virginia', 1000, 'GOOGLE');
insert into isciler values(567890123, 'Eddie Murphy', 'Texas', 7000, 'MICROSOFT');
insert into isciler values(456789012, 'Brad Pitt', 'Texas', 1500, 'GOOGLE');
insert into isciler values(123456710, 'Mark Stone', 'Pennsylvania', 2500, 'IBM');

select * from isciler;

select * from personel;

--1) her iki tablodaki ortak id'leri ve personel tablosunda bu id'ye sahip isimleri listeleyen query yaziniz

select id, isim from personel where id in
(select personel.id from personel inner join isciler on personel.id=isciler.id);

SELECT isim,id
FROM personel
WHERE id IN (SELECT id
FROM isciler
WHERE isciler.id=personel.id);

--2) her iki tablodaki ortak id ve isme sahip kayitlari listeleyen query yaziniz

select personel.id, personel.isim from personel inner join isciler on (personel.id=isciler.id and personel.isim=isciler.isim);

SELECT isim,id
FROM personel
INTERSECT
SELECT isim,id
FROM isciler;

--3) personel tablosunda kac farkli sehirden personel var

select count(distinct sehir) from personel;

SELECT COUNT (DISTINCT sehir) AS sehir_sayisi 
FROM personel;

--4) personel tablosunda id'si cift sayi olan personel'in tum bilgilerini listeleyen query yaziniz

select * from personel where id%2=0;

SELECT *
FROM personel 
WHERE MOD (id,2)=0;


--5) personel tablosunda kac tane kayit oldugunu gosteren query yazin

select count(*) from personel;

--6) isciler tablosunda en yuksek maasi alan kisinin tum bilgilerini gosteren query yazin

select * from isciler where maas=(select max(maas) from isciler);

SELECT *
FROM isciler
WHERE maas IN (SELECT MAX(maas)
FROM isciler);


--7) personel tablosunda en dusuk maasi alan kisinin tum bilgilerini gosteren query yazin

select * from personel where maas=(select min(maas) from personel);

SELECT *
FROM personel 
ORDER BY maas
FETCH NEXT 1 ROW ONLY;

--8) isciler tablosunda ikinci en yuksek maasi gosteren quere yazin

select * from isciler order by maas desc offset 1 limit 1;

SELECT MAX(maas)
FROM personel
WHERE maas<>(SELECT MAX(maas)
FROM personel);


--9) isciler tablosunda ikinci en dusuk maasi alan iscinin tum bilgilerini gosteren query yazin

select * from isciler order by maas offset 1 limit 1;

SELECT *
FROM isciler 
ORDER BY maas 
OFFSET 1 ROW
FETCH NEXT 1 ROW ONLY;


--10) isciler tablosunda en yuksek maasi alan iscinin disindaki tum iscilerin, tum bilgilerini gosteren query yazin

select * from isciler except (select * from isciler order by maas desc limit 1);

SELECT *
FROM isciler
WHERE maas<>( SELECT MAX(maas)
FROM isciler) 
ORDER BY maas DESC;







