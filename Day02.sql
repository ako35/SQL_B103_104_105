CREATE TABLE  ogrenciler5
(
ogrenci_no char(7),
isim varchar(20),
soy_isim varchar(25),
not_ort real,
kayit_tarih date
);

CREATE TABLE notlar
AS SELECT isim,not_ort 
FROM ogrenciler5;

SELECT * FROM ogrenciler6;

--INSERT- TABLO ICINE VERI EKLEME
INSERT INTO notlar VALUES ('Orhan',95.5);
INSERT INTO notlar VALUES ('Ali',75.5);
INSERT INTO notlar VALUES ('Musa',45.5);
INSERT INTO notlar VALUES ('Hakan',65.5);
INSERT INTO notlar VALUES ('Adem',75.5);
INSERT INTO notlar VALUES ('Sumeyye',85.5);

CREATE TABLE talebeler1
(
isim varchar(10),
notlar real
);
INSERT INTO talebeler1 VALUES ('Orhan',95.5);
INSERT INTO talebeler1 VALUES ('Ali',75.5);
INSERT INTO talebeler1 VALUES ('Musa',45.5);
INSERT INTO talebeler1 VALUES ('Hakan',65.5);
INSERT INTO talebeler1 VALUES ('Adem',75.5);
INSERT INTO talebeler1 VALUES ('Sumeyye',85.5);

SELECT isim FROM talebeler1;

CREATE TABLE  ogrenciler6
(
ogrenci_no char(7) unique,
isim varchar(20) not null,
soy_isim varchar(25),
not_ort real,
kayit_tarih date
);
SELECT * FROM ogrenciler6;

INSERT INTO ogrenciler6 VALUES ('1234567','Erol','Evren',75.5,now());
INSERT INTO ogrenciler6 VALUES ('1234568','Ali','Veli',75.5,now());
INSERT INTO ogrenciler6 (ogrenci_no,isim,not_ort) VALUES ('1234563','Evren',85.5);

CREATE TABLE  ogrenciler8
(
ogrenci_no char(7) PRIMARY KEY,
isim varchar(20),
soy_isim varchar(25),
not_ort real,
kayit_tarih date
);

CREATE TABLE  ogrenciler10
(
ogrenci_no char(7),
isim varchar(20),
soy_isim varchar(25),
not_ort real,
kayit_tarih date,
PRIMARY KEY(ogrenci_no)
);

CREATE TABLE  tedarikciler333
(
tedarikci_id char(5) PRIMARY KEY,
tedarikci_ismi varchar(20),
iletisim_isim varchar(20)
);

CREATE TABLE  urunler1
(
tedarikci_id char(5),
urun_id char(5),
FOREIGN KEY (tedarikci_id) REFERENCES tedarikciler333(tedarikci_id)
);




CREATE TABLE  adresler
(
adres_id char(5),
sokak char(15),
cadde char(15),
sehir varchar(15),
FOREIGN KEY (adres_id) REFERENCES tedarikciler3(adres_id)
);

CREATE TABLE calisanlar
(
id varchar(15) PRIMARY KEY,
isim varchar(30) UNIQUE,
maas int NOT NULL,
ise_baslama date
);
CREATE TABLE adresler
(
adres_id varchar(15),
sokak varchar(30),
cadde varchar(30),
sehir varchar(30),
FOREIGN KEY (adres_id) REFERENCES calisanlar(id)
);
INSERT INTO calisanlar VALUES('10002', 'Mehmet Yılmaz' ,12000, '2018-04-14');
INSERT INTO calisanlar VALUES('10008', null, 5000, '2018-04-14');
INSERT INTO calisanlar VALUES('10010', 'Mehmet Yilmaz', 5000, '2018-04-14');
INSERT INTO calisanlar VALUES('10004', 'Veli Han', 5000, '2018-04-14');
INSERT INTO calisanlar VALUES('10005', 'Mustafa Ali', 5000, '2018-04-14');
INSERT INTO calisanlar VALUES('10006', 'Canan Yaş', NULL, '2019-04-12');
INSERT INTO calisanlar VALUES('10003', 'CAN', 5000, '2018-04-14');
INSERT INTO calisanlar VALUES('10007', 'CAN', 5000, '2018-04-14');
INSERT INTO calisanlar VALUES('10009', 'cem', '', '2018-04-14');
INSERT INTO calisanlar VALUES('', 'osman', 2000, '2018-04-14');
INSERT INTO calisanlar VALUES('', 'osman can', 2000, '2018-04-14');
INSERT INTO calisanlar VALUES( '10002', 'ayse Yılmaz' ,12000, '2018-04-14');
INSERT INTO calisanlar VALUES( null, 'filiz ' ,12000, '2018-04-14');

INSERT INTO adresler VALUES('10003','Mutlu Sok', '40.Cad.','IST');
INSERT INTO adresler VALUES('10003','Can Sok', '50.Cad.','Ankara');
INSERT INTO adresler VALUES('10002','Ağa Sok', '30.Cad.','Antep');
-- Parent tabloda olmayan id ile child a ekleme yapamayiz
INSERT INTO adresler VALUES('10012','Ağa Sok', '30.Cad.','Antep');
-- FK'ye null değeri atanabilir.
INSERT INTO adresler VALUES(NULL,'Ağa Sok', '30.Cad.','Antep');
INSERT INTO adresler VALUES(NULL,'Ağa Sok', '30.Cad.','Maraş');









“calisanlar” isimli bir Tablo olusturun. Icinde “id”, “isim”, “maas”, “ise_baslama”
field’lari olsun. “id” yi Primary Key yapin, “isim” i Unique, “maas” i Not Null yapın.
“adresler” isminde baska bir tablo olusturun.Icinde “adres_id”, “sokak”, “cadde” ve
“sehir” fieldlari olsun.  “adres_id” field‘i ile Foreign Key oluşturun.
CREATE TABLE calisanlar
(
id varchar(15) PRIMARY KEY,
isim varchar(30) UNIQUE,
maas int NOT NULL,
ise_baslama date
);
CREATE TABLE adresler
(
adres_id varchar(30),
sokak varchar(30),
cadde varchar(30),
sehir varchar(30),
FOREIGN KEY (adres_id) REFERENCES calisanlar(id)
);
INSERT INTO calisanlar VALUES('10002', 'Mehmet Yılmaz' ,12000, '2018-04-14');
INSERT INTO calisanlar VALUES('10008', null, 5000, '2018-04-14');
INSERT INTO calisanlar VALUES('10010', 'Mehmet Yılmaz', 5000, '2018-04-14'); -- UNIQUE CONS. Kabul etmez
INSERT INTO calisanlar VALUES('10004', 'Veli Han', 5000, '2018-04-14');
INSERT INTO calisanlar VALUES('10005', 'Mustafa Ali', 5000, '2018-04-14');
INSERT INTO calisanlar VALUES('10006', 'Canan Yaş', 5000, '2019-04-12'); -- NOT NULL CONS. Kabul etmez
INSERT INTO calisanlar VALUES('10003', 'CAN', 5000, '2018-04-14');
INSERT INTO calisanlar VALUES('10007', 'CAN', 5000, '2018-04-14'); -- UNIQUE CONS. Kabul etmez
INSERT INTO calisanlar VALUES('10009', 'cem', '', '2018-04-14');
INSERT INTO calisanlar VALUES('', 'osman', 2000, '2018-04-14');
INSERT INTO calisanlar VALUES(' ', 'osman can', 2000, '2018-04-14'); -- PRIMARY KEY
INSERT INTO calisanlar VALUES( '10002', 'ayse Yılmaz' ,12000, '2018-04-14'); -- PRIMARY KEY
INSERT INTO calisanlar VALUES( null, 'filiz ' ,12000, '2018-04-14'); -- PRIMARY KEY

INSERT INTO adresler VALUES('10003','Mutlu Sok', '40.Cad.','IST');
INSERT INTO adresler VALUES('10003','Can Sok', '50.Cad.','Ankara');
INSERT INTO adresler VALUES('10002','Ağa Sok', '30.Cad.','Antep');
-- Parent tabloda olmayan id ile child a ekleme yapamayiz
INSERT INTO adresler VALUES('10012','Ağa Sok', '30.Cad.','Antep');
-- FK'ye null değeri atanabilir.
INSERT INTO adresler VALUES(NULL,'Ağa Sok', '30.Cad.','Antep');
INSERT INTO adresler VALUES(NULL,'Ağa Sok', '30.Cad.','Maraş');

SELECT * FROM calisanlar;
SELECT * FROM adresler;


CREATE TABLE calisanlar1
(
id varchar(15) PRIMARY KEY,
isim varchar(30) UNIQUE,
maas int CHECK (maas>10000),
ise_baslama date
);

INSERT INTO calisanlar1 VALUES('10002', 'Mehmet Yılmaz' ,19000, '2018-04-14');

SELECT * FROM calisanlar;

SELECT isim FROM calisanlar;

SELECT isim,maas FROM calisanlar WHERE maas>5000;

SELECT * FROM calisanlar WHERE isim='Veli Han';

SELECT * FROM calisanlar WHERE maas=5000;

DELETE FROM adresler WHERE sehir='Antep';

CREATE TABLE ogrenciler66
(
id int,
isim VARCHAR(50),
veli_isim VARCHAR(50),
yazili_notu int
);

INSERT INTO ogrenciler66 VALUES(123, 'Ali Can', 'Hasan',75);
INSERT INTO ogrenciler66 VALUES(124, 'Merve Gul', 'Ayse',85);
INSERT INTO ogrenciler66 VALUES(125, 'Kemal Yasa', 'Hasan',85);
INSERT INTO ogrenciler66 VALUES(126, 'Nesibe Yilmaz', 'Ayse',95);
INSERT INTO ogrenciler66 VALUES(127, 'Mustafa Bak', 'Can',99);
INSERT INTO ogrenciler66 VALUES(127, 'Mustafa Bak', 'Ali', 99);

SELECT * FROM ogrenciler66;

DELETE FROM ogrenciler66 WHERE isim='Nesibe Yilmaz' OR isim='Mustafa Bak';


