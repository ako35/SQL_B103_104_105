--group by
drop table if exists personel;

CREATE TABLE personel
(
id int,
isim varchar(50),  
sehir varchar(50),  
maas int,  
sirket varchar(20)
);

INSERT INTO personel VALUES(123456789, 'Ali Yilmaz', 'Istanbul', 5500, 'Honda');  
INSERT INTO personel VALUES(234567890, 'Veli Sahin', 'Istanbul', 4500, 'Toyota');  
INSERT INTO personel VALUES(345678901, 'Mehmet Ozturk', 'Ankara', 3500, 'Honda');  
INSERT INTO personel VALUES(456789012, 'Mehmet Ozturk', 'Izmir', 6000, 'Ford');  
INSERT INTO personel VALUES(567890123, 'Mehmet Ozturk', 'Ankara', 7000, 'Tofas');  
INSERT INTO personel VALUES(456789012, 'Veli Sahin', 'Ankara', 4500, 'Ford');  
INSERT INTO personel VALUES(123456710, 'Hatice Sahin', 'Bursa', 4500, 'Honda');

--1)Isme gore toplam maaslari bulun
select isim, sum(maas) from personel group by isim;

-- sehire gore toplam personel sayisini bulun
select isim, count(sehir) from personel group by isim;

--1) Her sirketin MIN maaslarini eger 4000’den buyukse goster
select sirket, min(maas) from personel 
group by sirket having min(maas)>4000;

-- 2) Ayni isimdeki kisilerin aldigi toplam gelir 10000 liradan fazla ise ismi
--    ve toplam maasi gosteren sorgu yaziniz
select isim, sum(maas) from personel group by isim having sum(maas)>10000;

-- Eger bir sehirde calisan personel sayisi 1’den coksa sehir ismini ve 
--     personel sayisini veren sorgu yaziniz
select sehir, count(isim) from personel group by sehir
having count(isim)>1;

--Eger bir sehirde alinan MAX maas 5000’den dusukse sehir ismini ve 
--    MAX maasi veren sorgu yaziniz
select sehir, max(maas) from personel group by sehir
having max(maas)<5000;

-- 1) Maasi 4000’den cok olan isci isimlerini ve 5000 liradan fazla maas alinan
-- sehirleri gosteren sorguyu yaziniz
select isim, maas from personel where maas>4000
union
select sehir, maas from personel where maas>5000;

-- mehmet ozturk ismindeki kisilerin aldigi maaslari ve istanbul'daki personelin maaslarini
-- bir tabloda gosteren sorgu yaziniz
select sehir, maas from personel where sehir='Istanbul'
union
select isim, maas from personel where isim='Mehmet Ozturk'
order by maas desc;

--sehirlerden odenen ucret 3000'den fazla olanlari ve personelden ucreti 5000'den az olanlari bir tabloda 
--maas miktarina gore sirali olarak gosteren sorguyu yaziniz
select sehir, maas from personel where maas>3000
union
select isim, maas from personel where maas<5000;

DROP TABLE if exists personel

CREATE TABLE personel
(
id int,
isim varchar(50),  
sehir varchar(50), 
maas int,  
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

CREATE TABLE personel_bilgi  (
id int,
tel char(10) UNIQUE ,  
cocuk_sayisi int,
CONSTRAINT personel_bilgi_fk FOREIGN KEY (id) REFERENCES personel(id)
);

INSERT INTO personel_bilgi VALUES(123456789, '5302345678', 5);  
INSERT INTO personel_bilgi VALUES(234567890, '5422345678', 4);
INSERT INTO personel_bilgi VALUES(345678901, '5354561245', 3);
INSERT INTO personel_bilgi VALUES(456789012, '5411452659', 3);
INSERT INTO personel_bilgi VALUES(567890123, '5551253698', 2);
INSERT INTO personel_bilgi VALUES(456789012, '5524578574', 2);
INSERT INTO personel_bilgi VALUES(123456710, '5537488585', 1);

select * from personel

select * from personel_bilgi

--id’si 123456789 olan personelin Personel tablosundan sehir ve maasini, 
--personel_bilgi  tablosundan da tel ve cocuk sayisini yazdirin
select sehir, maas from personel where id=123456789
union
select tel, cocuk_sayisi from personel_bilgi where id=123456789;

-- UNION ALL
/*
Union tekrarli verileri teke düşürür ve bize o şekilde sonuç verir
Union All ise tekrarli verilerle birlikte tün sorguları getirir
*/
--Personel tablosundada maasi 5000’den az olan tum isimleri ve maaslari bulunuz
select isim, maas from personel where maas<5000
union all
select isim, maas from personel where maas<5000;

select sehir, maas from personel where maas>4000
union all
select isim, maas from personel where maas<5000;

--intersect (kesisim)-iki tablonun ortak verilerini verir.

-- Personel tablosundan Istanbul veya Ankara’da calisanlarin id’lerini yazdir
-- Personel_bilgi tablosundan 2 veya 3 cocugu olanlarin id lerini yazdirin
--Iki sorguyu INTERSECT ile birlestirin
select id from personel where sehir in ('Istanbul', 'Ankara')
intersect
select id from personel_bilgi where cocuk_sayisi in (2,3);

select id from personel where maas not between 4800 and 5500;
intersect
select id from personel_bilgi where cocuk_sayisi in (2,3);

-- Honda,Ford ve Tofas’ta calisan ortak isimde personel varsa listeleyin
select isim from personel where sirket='Honda'
intersect
select isim from personel where sirket='Ford'
intersect
select isim from personel where sirket='Tofas';

--except kullanimi
/*
iki sorgulamada harici bir sorgulama istenirse except komutu kullanilir
*/
--5000'den az maas alip Honda'da calismayanlari yazdirin
select isim, sirket from personel where maas<5000
except
select isim, sirket from personel where sirket='Honda';












