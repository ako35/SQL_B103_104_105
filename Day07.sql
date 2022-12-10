--distinct kullanimi

CREATE TABLE musteri_urun 
(
urun_id int, 
musteri_isim varchar(50),
urun_isim varchar(50) 
);

INSERT INTO musteri_urun VALUES (10, 'Ali', 'Portakal'); 
INSERT INTO musteri_urun VALUES (10, 'Ali', 'Portakal'); 
INSERT INTO musteri_urun VALUES (20, 'Veli', 'Elma'); 
INSERT INTO musteri_urun VALUES (30, 'Ayse', 'Armut'); 
INSERT INTO musteri_urun VALUES (20, 'Ali', 'Elma'); 
INSERT INTO musteri_urun VALUES (10, 'Adem', 'Portakal'); 
INSERT INTO musteri_urun VALUES (40, 'Veli', 'Kaysi'); 
INSERT INTO musteri_urun VALUES (20, 'Elif', 'Elma');

select * from musteri_urun;

--musteri urun tablosundan urun isimlerini tekrarsiz listeleyiniz
--distinct ile cozumu
select distinct(urun_isim) from musteri_urun;

--group by ile cozumu
select urun_isim from musteri_urun group by urun_isim;

-- Tabloda kac farkli meyve vardir ?
select count(distinct(urun_isim)) from musteri_urun
group by urun_isim;

--fetch next () row only / offset / limit

--musteri urun tablosundan ilk uc kaydi listeleyiniz
select * from musteri_urun order by urun_id fetch next 3 row only;

--limit
select * from musteri_urun order by urun_id limit 3;

--musteri urun tablosundan ilk kaydi listeleyiniz
select * from musteri_urun order by urun_id limit 1;

--musteri urun tablosundan son uc kaydi listeleyiniz
select * from musteri_urun order by urun_id desc limit 3;

CREATE TABLE maas 
(
id int, 
musteri_isim varchar(50),
maas int 
);

INSERT INTO maas VALUES (10, 'Ali', 5000); 
INSERT INTO maas VALUES (10, 'Ali', 7500); 
INSERT INTO maas VALUES (20, 'Veli', 10000); 
INSERT INTO maas VALUES (30, 'Ayse', 9000); 
INSERT INTO maas VALUES (20, 'Ali', 6500); 
INSERT INTO maas VALUES (10, 'Adem', 8000); 
INSERT INTO maas VALUES (40, 'Veli', 8500); 
INSERT INTO maas VALUES (20, 'Elif', 5500);

--en yuksek maas alan musteriyi listeleyiniz
select * from maas order by maas desc limit 1;

--maas tablosundan en yuksek ikinci maasi listeleyiniz
select * from maas order by maas desc offset 1 limit 1;

--offset --> satir atlamak istedigimizde offset komutunu kullaniriz

select * from maas order by maas desc offset 1 row fetch next 1 row only;

--maas tablosundan en dusuk dorduncu maasi listeleyiniz
select * from maas order by maas offset 3 limit 1;

--ddl --> alter table 

drop table personel;

CREATE TABLE personel  (
id int,
isim varchar(50),  sehir varchar(50),  maas int,  
sirket varchar(20),
CONSTRAINT personel_pk PRIMARY KEY (id)
);

INSERT INTO personel VALUES(123456789, 'Ali Yilmaz', 'Istanbul', 5500, 'Honda');  
INSERT INTO personel VALUES(234567890, 'Veli Sahin', 'Istanbul', 4500, 'Toyota');  
INSERT INTO personel VALUES(345678901, 'Mehmet Ozturk', 'Ankara', 3500, 'Honda');  
INSERT INTO personel VALUES(456789012, 'Mehmet Ozturk', 'Izmir', 6000, 'Ford');  
INSERT INTO personel VALUES(567890123, 'Mehmet Ozturk', 'Ankara', 7000, 'Tofas');  
INSERT INTO personel VALUES(456715012, 'Veli Sahin', 'Ankara', 4500, 'Ford');  
INSERT INTO personel VALUES(123456710, 'Hatice Sahin', 'Bursa', 4500, 'Honda');

select * from personel;

-- add default deger ile tabloya bir field ekleme
alter table personel add ulke varchar(30);

alter table personel add adres varchar(50) default 'Turkiye';

alter table personel add zipcode varchar(30);

--drop tablodan sutun silme
alter table personel drop column zipcode;

alter table personel drop ulke_isim;

--rename colomn sutun adi degistirme
alter table personel rename column sehir to il;

--rename tablonun adini degistirme
alter table personel rename to isci;

select * from isci;

--type / set (modify) sutunlarin ozelliklerini degistirme
alter table isci alter column il type varchar(30), alter column maas set not null;

alter table isci alter column maas type varchar(30) using(maas::varchar(30))

alter table isci alter column maas type int using(maas::varchar(30));

drop table ogrenciler2;

-- TRANSACTION (begin-savepoint-rollback-commit )

--transaction baslatmak icin begin komutu kullanmamiz gerekir ve transaction'i sonlandirmak icin commit komutu calistirilir
CREATE TABLE ogrenciler2
(
id serial,
isim VARCHAR(50),
veli_isim VARCHAR(50),
yazili_notu real       
);

BEGIN;

INSERT INTO ogrenciler2 VALUES(default, 'Ali Can', 'Hasan',75.5);
INSERT INTO ogrenciler2 VALUES(default, 'Merve Gul', 'Ayse',85.3);

savepoint x;

INSERT INTO ogrenciler2 VALUES(default, 'Kemal Yasa', 'Hasan',85.6);
INSERT INTO ogrenciler2 VALUES(default, 'Nesibe Yilmaz', 'Ayse',95.3);

savepoint y;

INSERT INTO ogrenciler2 VALUES(default, 'Mustafa Bak', 'Can',99);
INSERT INTO ogrenciler2 VALUES(default, 'Can Bak', 'Ali', 67.5);

ROLLBACK to y;

COMMIT;

select * from ogrenciler2;

delete from ogrenciler2;




