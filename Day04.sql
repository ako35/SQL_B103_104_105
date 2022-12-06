drop table calisanlar;

CREATE TABLE calisanlar (
calisan_id char(9),
calisan_isim varchar(50),
calisan_dogdugu_sehir varchar(50)
);

INSERT INTO calisanlar VALUES(123456789, 'Ali Can', 'Istanbul'); 
INSERT INTO calisanlar VALUES(234567890, 'Veli Cem', 'Ankara'); 
INSERT INTO calisanlar VALUES(345678901, 'Mine Bulut', 'Izmir');

select * from calisanlar;

select calisan_id as id, calisan_isim || ' ' || calisan_dogdugu_sehir as calisan_bilgisi from calisanlar;

select calisan_id as id, concat (calisan_isim,' ', calisan_dogdugu_sehir) as calisan_bilgisi from calisanlar;

drop table personel;

create table personel
(
id int,
isim varchar(50),
soyisim varchar(50),
email varchar(50),
ise_baslama_tar date,
is_unvani varchar(50),
maas int
);

select * from personel;

insert into personel values(123456789,'Ali','Can','alican@gmail.com','10-apr-10','isci',5000);
insert into personel values(123456788,'Veli','Cem','velicem@gmail.com','10-jan-12','isci',5500);
insert into personel values(123456787,'Ayse','Gul','aysegul@gmail.com','01-may-14','muhabeseci',4500);
insert into personel values(123456789,'Fatma','Yasa','fatmayasa@gmail.com','10-apr-09','muhendis',7500);

select isim from personel where maas<5000 or is_unvani='isci';

select * from personel where is_unvani='isci';

select is_unvani, maas from personel where soyisim in('Can', 'Cem', 'Gul');

select email,ise_baslama_tar from personel where maas>5000;

select * from personel where maas between 5000 and 7000;

drop table insanlar;

CREATE TABLE insanlar
(
ssn char(9),
name varchar(50),  
adres varchar(50)
);

INSERT INTO insanlar VALUES(123456789, 'Ali Can', 'Istanbul');  
INSERT INTO insanlar VALUES(234567890, 'Veli Cem', 'Ankara');  
INSERT INTO insanlar VALUES(345678901, 'Mine Bulut', 'Izmir');  
INSERT INTO insanlar (ssn, adres) VALUES(456789012, 'Bursa'); 
INSERT INTO insanlar (ssn, adres) VALUES(567890123, 'Denizli');

select * from insanlar;

select name from insanlar where name is null;

select name from insanlar where name is not null;

update insanlar 
set name='no name'
where name is null;

/*
Tablolardaki verileri sıralamak için ORDER BY komutu kullanırız
Büyükten küçüğe yada küçükten büyüğe sıralama yapabiliriz
Default olarak küçükten büyüğe sıralama yapar
Eğer BÜYÜKTEN KÜÇÜĞE sıralmak istersek ORDER BY komutundan sonra DESC komutunu kullanırız
*/

drop table if exists insanlar

CREATE TABLE insanlar
(
ssn char(9),
isim varchar(50),
soyad varchar(50),  
adres varchar(50)
);

INSERT INTO insanlar VALUES(123456789, 'Ali','Can', 'Istanbul');
INSERT INTO insanlar VALUES(234567890, 'Veli','Cem', 'Ankara');  
INSERT INTO insanlar VALUES(345678901, 'Mine','Bulut', 'Ankara');  
INSERT INTO insanlar VALUES(256789012, 'Mahmut','Bulut', 'Istanbul'); 
INSERT INTO insanlar VALUES (344678901, 'Mine','Yasa', 'Ankara');  
INSERT INTO insanlar VALUES (345678901, 'Veli','Yilmaz', 'Istanbul');

select * from insanlar;

select * from insanlar order by adres;

select * from insanlar order by soyad;

select * from insanlar where isim='Mine' order by ssn;

select * from insanlar where soyad='Bulut' order by 2;

select * from insanlar order by ssn desc;

select * from insanlar order by isim asc, soyad desc;

select isim, soyad from insanlar order by length (soyad) desc;

select isim || ' ' || soyad as isim_soyisim from insanlar order by length (isim || soyad) desc;

select isim || ' ' || soyad as isim_soyisim from insanlar order by length (isim) + length (soyad);

select concat(isim, ' ' ,soyad) as isim_soyisim from insanlar order by length(isim)+ length(soyad);

--GROUP BY CLAUSE
/*
Group By komutu sonuçları bir veya daha fazla sütuna göre gruplamak için SELECT
komutuyla birlikte kullanılır.
*/

drop table if exists manav;

CREATE TABLE manav
(
isim varchar(50),
Urun_adi varchar(50),
Urun_miktar int
);

INSERT INTO manav VALUES( 'Ali', 'Elma', 5);
INSERT INTO manav VALUES( 'Ayse', 'Armut', 3);
INSERT INTO manav VALUES( 'Veli', 'Elma', 2);
INSERT INTO manav VALUES( 'Hasan', 'Uzum', 4);
INSERT INTO manav VALUES( 'Ali', 'Armut', 2);
INSERT INTO manav VALUES( 'Ayse', 'Elma', 3);
INSERT INTO manav VALUES( 'Veli', 'Uzum', 5);
INSERT INTO manav VALUES( 'Ali', 'Armut', 2);
INSERT INTO manav VALUES( 'Veli', 'Elma', 3);
INSERT INTO manav VALUES( 'Ayse', 'Uzum', 2);

select * from manav;

select isim, sum(urun_miktar) as aldigi_toplam_urun from manav group by isim order by sum(urun_miktar) desc;

select urun_adi, count(isim) from manav group by urun_adi;

select isim, count(urun_adi) from manav group by isim;









