CREATE TABLE ogrenciler100
(
id int,
isim VARCHAR(50),
veli_isim VARCHAR(50),
yazili_notu int
);
iNSERT INTO ogrenciler100 VALUES(123, 'Ali Can', 'Hasan',75);
INSERT INTO ogrenciler100 VALUES(124, 'Merve Gul', 'Ayse',85);
INSERT INTO ogrenciler100 VALUES(125, 'Kemal Yasa', 'Hasan',85);
INSERT INTO ogrenciler100 VALUES(126, 'Nesibe Yilmaz', 'Ayse',95);
INSERT INTO ogrenciler100 VALUES(127, 'Mustafa Bak', 'Can',99);
INSERT INTO ogrenciler100 VALUES(127, 'Mustafa Bak', 'Ali', 99);
select * from ogrenciler100;
-- ismi Nesibe Yilmaz veya Mustafa Bak olan kayıtları silelim.
delete from ogrenciler100 where isim= 'Mustafa Bak' or isim='Nesibe Yilmaz';
delete from ogrenciler100 where veli_isim= 'Hasan';

--TRUNCATE--
--Bir tablodaki tum verileri geri alamayacagimiz sekilde siler sartli silme yapmaz
TRUNCATE TABLE ogrenciler100;

DROP TABLE IF EXISTS talebe;

CREATE TABLE talebe
(
id CHAR(3) primary key,
isim VARCHAR(50),
veli_isim VARCHAR(50),
yazili_notu int
);

CREATE TABLE not1
(
talebe_id char(3),
ders_adi varchar(30),
yazili_notu int,
CONSTRAINT notlar_fk FOREIGN KEY (talebe_id) REFERENCES talebe(id)
on delete cascade
);

INSERT INTO talebe VALUES(123, 'Ali Can', 'Hasan',75);
INSERT INTO talebe VALUES(124, 'Merve Gul', 'Ayse',85);
INSERT INTO talebe VALUES(125, 'Kemal Yasa', 'Hasan',85);
INSERT INTO talebe VALUES(126, 'Nesibe Yılmaz', 'Ayse',95);
INSERT INTO talebe VALUES(127, 'Mustafa Bak', 'Can',99);

INSERT INTO not1 VALUES ('123','kimya',75);
INSERT INTO not1 VALUES ('124', 'fizik',65);
INSERT INTO not1 VALUES ('125', 'tarih',90);
INSERT INTO not1 VALUES ('126', 'Matematik',90);

SELECT * FROM not1;
SELECT * FROM talebe;

DELETE FROM not1 WHERE talebe_id='123';

DELETE FROM talebe WHERE id='126';

DROP TABLE IF EXISTS musteriler;
CREATE TABLE musteriler (
urun_id int,
musteri_isim varchar(50), urun_isim varchar(50)
);

INSERT INTO musteriler VALUES (10, 'Mark', 'Orange'); 
INSERT INTO musteriler VALUES (10, 'Mark', 'Orange');  
INSERT INTO musteriler VALUES (20, 'John', 'Apple'); 
INSERT INTO musteriler VALUES (30, 'Amy', 'Palm'); 
INSERT INTO musteriler VALUES (20, 'Mark', 'Apple'); 
INSERT INTO musteriler VALUES (10, 'Adem', 'Orange'); 
INSERT INTO musteriler VALUES (40, 'John', 'Apricot'); 
INSERT INTO musteriler VALUES (20, 'Eddie', 'Apple');

SELECT * FROM musteriler;

--Musteriler tablosundan urun ismi orange apple ve apricot olan datalari listeleyiniz

SELECT * FROM musteriler WHERE (urun_isim='Orange' OR urun_isim='Apple' OR urun_isim='Apricot');

SELECT * FROM musteriler WHERE urun_isim IN('Orange','Apple','Apricot');

SELECT * FROM musteriler WHERE urun_isim NOT IN('Orange','Apple','Apricot');

SELECT * FROM musteriler WHERE urun_id>=20 AND urun_id<=40;

SELECT * FROM musteriler WHERE urun_id NOT BETWEEN 20 AND 40;

CREATE TABLE personel
(
id char(4),
isim varchar(50),
maas int
);

INSERT INTO personel VALUES('1001','Ali Can',70000);
INSERT INTO personel VALUES('1002','Veli Mert',85000);
INSERT INTO personel VALUES('1003','Ayse Tan',65000);
INSERT INTO personel VALUES('1004','Derya Soylu',95000);
INSERT INTO personel VALUES('1005','Yavuz Bal',80000);
INSERT INTO personel VALUES('1006','Sena Beyaz',100000);

SELECT * FROM  personel WHERE id BETWEEN '1003' AND '1005';

SELECT * FROM personel WHERE isim BETWEEN 'D' AND 'Y';

SELECT * FROM personel WHERE isim NOT BETWEEN 'D' AND 'Y';

SELECT * FROM personel WHERE maas=70000 AND isim='Sena';

CREATE TABLE calisanlar2
(
id int,
isim VARCHAR(50),
sehir VARCHAR(50),
maas int,
isyeri VARCHAR(20)
);

INSERT INTO calisanlar2 VALUES(123456789, 'Ali Seker', 'Istanbul', 2500, 'Vakko');
INSERT INTO calisanlar2 VALUES(234567890, 'Ayse Gul', 'Istanbul', 1500, 'LCWaikiki');
INSERT INTO calisanlar2 VALUES(345678901, 'Veli Yilmaz', 'Ankara', 3000, 'Vakko');
INSERT INTO calisanlar2 VALUES(456789012, 'Veli Yilmaz', 'Izmir', 1000, 'Pierre Cardin');
INSERT INTO calisanlar2 VALUES(567890123, 'Veli Yilmaz', 'Ankara', 7000, 'Adidas');
INSERT INTO calisanlar2 VALUES(456789012, 'Ayse Gul', 'Ankara', 1500, 'Pierre Cardin');
INSERT INTO calisanlar2 VALUES(123456710, 'Fatma Yasa', 'Bursa', 2500, 'Vakko');

SELECT * FROM calisanlar2;

CREATE TABLE markalar
(
marka_id int,
marka_isim VARCHAR(20),
calisan_sayisi int
);

INSERT INTO markalar VALUES(100, 'Vakko', 12000);
INSERT INTO markalar VALUES(101, 'Pierre Cardin', 18000);
INSERT INTO markalar VALUES(102, 'Adidas', 10000);
INSERT INTO markalar VALUES(103, 'LCWaikiki', 21000);
INSERT INTO markalar VALUES(104, 'Nike', 19000);

SELECT * FROM markalar;

SELECT isim, maas, isyeri FROM calisanlar2 WHERE isyeri IN 
(SELECT marka_isim FROM markalar WHERE calisan_sayisi>15000);

SELECT isim, maas, sehir FROM calisanlar2 WHERE isyeri IN
(SELECT marka_isim FROM markalar WHERE marka_id>101);

--ÖDEV- Ankara’da calisani olan markalarin marka id'lerini ve calisan sayilarini listeleyiniz.
SELECT marka_id, calisan_sayisi FROM markalar WHERE marka_isim IN 
(SELECT isyeri FROM calisanlar2 WHERE sehir='Ankara');

SELECT MAX(maas) AS maksimum_maas FROM calisanlar2;

SELECT MIN(maas) AS minimum_maas FROM calisanlar2;

SELECT SUM(maas) FROM calisanlar2;

SELECT AVG(maas) FROM calisanlar2;

SELECT round(AVG(maas),2) FROM calisanlar2;

SELECT COUNT(maas) FROM calisanlar2;

SELECT COUNT(maas) AS maas_sayisi FROM calisanlar2;

SELECT COUNT(*) AS maas_sayisi FROM calisanlar2;

SELECT marka_id, marka_isim, 
(SELECT COUNT(sehir) AS sehir_sayisi FROM calisanlar2 WHERE marka_isim=isyeri)
FROM markalar;

SELECT marka_isim,calisan_sayisi,
(SELECT SUM(maas) FROM calisanlar2 WHERE isyeri=marka_isim) AS toplam_maas
FROM markalar;

SELECT marka_isim,calisan_sayisi,
(SELECT MAX(maas) FROM calisanlar2 WHERE marka_isim=isyeri) AS en_yuksek_maas,
(SELECT MIN(maas) FROM calisanlar2 WHERE marka_isim=isyeri) AS en_dusuk_maas
FROM markalar;

CREATE VIEW maxminmaas
AS
SELECT marka_isim,calisan_sayisi,
(SELECT MAX(maas) FROM calisanlar2 WHERE marka_isim=isyeri) AS en_yuksek_maas,
(SELECT MIN(maas) FROM calisanlar2 WHERE marka_isim=isyeri) AS en_dusuk_maas
FROM markalar;

SELECT * FROM maxminmaas;

CREATE VIEW toplammMaas
AS
SELECT marka_isim,
(SELECT SUM(maas) FROM calisanlar2 WHERE marka_isim=isyeri) AS toplam_maas
FROM markalar;

SELECT * FROM toplammMaas;

CREATE TABLE mart
(   
urun_id int,    
musteri_isim varchar(50), urun_isim varchar(50)
);
INSERT INTO mart VALUES (10, 'Mark', 'Honda');
INSERT INTO mart VALUES (20, 'John', 'Toyota');
INSERT INTO mart VALUES (30, 'Amy', 'Ford');
INSERT INTO mart VALUES (20, 'Mark', 'Toyota');
INSERT INTO mart VALUES (10, 'Adam', 'Honda');
INSERT INTO mart VALUES (40, 'John', 'Hyundai');
INSERT INTO mart VALUES (20, 'Eddie', 'Toyota');

CREATE TABLE nisan 
(   
urun_id int ,
musteri_isim varchar(50), urun_isim varchar(50)
);
INSERT INTO nisan VALUES (10, 'Hasan', 'Honda');
INSERT INTO nisan VALUES (10, 'Kemal', 'Honda');
INSERT INTO nisan VALUES (20, 'Ayse', 'Toyota');
INSERT INTO nisan VALUES (50, 'Yasar', 'Volvo');
INSERT INTO nisan VALUES (20, 'Mine', 'Toyota');

SELECT * FROM mart;
SELECT * FROM nisan;

--MART VE NİSAN aylarında aynı URUN_ID ile satılan ürünlerin
-- URUN_ID’lerini listeleyen ve aynı zamanda bu ürünleri MART ayında alan
-- MUSTERI_ISIM 'lerini listeleyen bir sorgu yazınız.

SELECT urun_id, musteri_isim FROM mart
WHERE EXISTS (SELECT urun_id FROM nisan WHERE mart.urun_id=nisan.urun_id)

SELECT urun_isim, musteri_isim FROM nisan
WHERE EXISTS (SELECT urun_isim FROM mart WHERE mart.urun_id=nisan.urun_id)

SELECT urun_isim, musteri_isim FROM nisan
WHERE NOT EXISTS (SELECT urun_isim FROM mart WHERE mart.urun_id=nisan.urun_id);



CREATE TABLE tedarikciler -- parent
(
vergi_no int PRIMARY KEY,
firma_ismi VARCHAR(50),
irtibat_ismi VARCHAR(50)
);
INSERT INTO tedarikciler VALUES (101, 'IBM', 'Kim Yon');
INSERT INTO tedarikciler VALUES (102, 'Huawei', 'Çin Li');
INSERT INTO tedarikciler VALUES (103, 'Erikson', 'Maki Tammen');
INSERT INTO tedarikciler VALUES (104, 'Apple', 'Adam Eve');

CREATE TABLE urunler -- child
(
ted_vergino int, 
urun_id int, 
urun_isim VARCHAR(50), 
musteri_isim VARCHAR(50),
CONSTRAINT fk_urunler FOREIGN KEY(ted_vergino) REFERENCES tedarikciler(vergi_no)
on delete cascade
);    
INSERT INTO urunler VALUES(101, 1001,'Laptop', 'Ayşe Can');
INSERT INTO urunler VALUES(102, 1002,'Phone', 'Fatma Aka');
INSERT INTO urunler VALUES(102, 1003,'TV', 'Ramazan Öz');
INSERT INTO urunler VALUES(102, 1004,'Laptop', 'Veli Han');
INSERT INTO urunler VALUES(103, 1005,'Phone', 'Canan Ak');
INSERT INTO urunler VALUES(104, 1006,'TV', 'Ali Bak');
INSERT INTO urunler VALUES(104, 1007,'Phone', 'Aslan Yılmaz');

SELECT * FROM tedarikciler;
SELECT * FROM urunler;

UPDATE tedarikciler
SET firma_ismi='Vestel' WHERE vergi_no=102;

-- vergi_no’su 101 olan tedarikçinin firma ismini 'casper' ve irtibat_ismi’ni 'Ali Veli' olarak güncelleyiniz.
UPDATE tedarikciler
SET firma_ismi='Casper' AND irtibar_ismi='Ali Veli' WHERE vergi_no=101;

UPDATE tedarikciler
SET firma_ismi='casper', irtibat_ismi='Ali Veli' WHERE vergi_no=101;

UPDATE urunler
SET urun_isim='Telefon' WHERE urun_isim='Phone';

-- urunler tablosundaki urun_id değeri 1004'ten büyük olanların urun_id’sini 1 arttırın.

UPDATE urunler
SET urun_id=urun_id+1 WHERE urun_id>1004;

UPDATE urunler
SET urun_id=urun_id+ted_vergino;

DELETE FROM urunler

UPDATE urunler 
SET urun_isim=(SELECT firma_ismi FROM tedarikciler WHERE irtibat_ismi='Adam Eve')
WHERE musteri_isim='Ali Bak';

UPDATE urunler
SET musteri_isim=(SELECT irtibat_ismi FROM tedarikciler WHERE firma_ismi='Apple')
WHERE urun_isim='Laptop'


