CREATE TABLE sirketler  (
sirket_id int,  
sirket_isim varchar(20)
);

INSERT INTO sirketler VALUES(100, 'Toyota');  
INSERT INTO sirketler VALUES(101, 'Honda');  
INSERT INTO sirketler VALUES(102, 'Ford');  
INSERT INTO sirketler VALUES(103, 'Hyundai');

CREATE TABLE siparisler  (
siparis_id int,  
sirket_id int,  
siparis_tarihi date
);

INSERT INTO siparisler VALUES(11, 101, '2020-04-17');  
INSERT INTO siparisler VALUES(22, 102, ' 2020-04-18');  
INSERT INTO siparisler VALUES(33, 103, ' 2020-04-19');  
INSERT INTO siparisler VALUES(44, 104, ' 2020-04-20');  
INSERT INTO siparisler VALUES(55,  105, ' 2020-04-21');

-- SORU) Iki Tabloda sirket_id’si ayni olanlarin sirket_ismi, siparis_id ve
--       siparis_tarihleri ile yeni bir tablo olusturun
select sirketler.sirket_isim, siparisler.siparis_id, siparisler.siparis_tarihi
from sirketler inner join siparisler on sirketler.sirket_id=siparisler.sirket_id;

select sirketler.sirket_isim, siparisler.siparis_id, siparisler.siparis_tarihi
from sirketler left join siparisler on sirketler.sirket_id=siparisler.sirket_id;

select sirketler.sirket_isim, siparisler.siparis_id, siparisler.siparis_tarihi
from sirketler right join siparisler on sirketler.sirket_id=siparisler.sirket_id;

--ornek
select sirket_id from sirketler 
intersect
select sirket_id from siparisler

--full join
select sirketler.sirket_isim, siparisler.siparis_id, siparisler.siparis_tarihi
from sirketler full join siparisler on sirketler.sirket_id=siparisler.sirket_id;

drop table if exists personel cascade;

CREATE TABLE personel 
(
id int,
isim varchar(20), 
title varchar(60), 
yonetici_id int
);

INSERT INTO personel VALUES(1, 'Ali Can', 'SDET', 2);
INSERT INTO personel VALUES(2, 'Veli Cem', 'QA', 3);
INSERT INTO personel VALUES(3, 'Ayse Gul', 'QA Lead', 4); 
INSERT INTO personel VALUES(4, 'Fatma Can', 'CEO', 5);

select * from personel;

--Her personelin yanina yonetici ismini yazdiran bir tablo olusturun
select isim from personel;
select p1.isim, p2.isim from personel p1 inner join personel p2 on p1.yonetici_id=p2.id;

drop table if exists musteriler;

CREATE TABLE musteriler  (
id int UNIQUE,
isim varchar(50) NOT NULL,
gelir int
);

INSERT INTO musteriler (id, isim, gelir) VALUES (1001, 'Ali', 62000);  
INSERT INTO musteriler (id, isim, gelir) VALUES (1002, 'Ayse', 57500);  
INSERT INTO musteriler (id, isim, gelir) VALUES (1003, 'Feride', 71000);
INSERT INTO musteriler (id, isim, gelir) VALUES (1004, 'Fatma', 42000);  
INSERT INTO musteriler (id, isim, gelir) VALUES (1005, 'Kasim', 44000);
INSERT INTO musteriler (id, isim, gelir) VALUES (1006, 'ahmet', 82000);

-- SORU : Ismi A harfi ile baslayan musterilerin tum bilgilerini yazdiran QUERY yazin
/*
	like kullaniminda buyuk kucuk harf gozetmeksizin sonuc almak istersek ilike kullaniriz.
	like yerine ~~sembollerini kullanabiliriz
*/
select * from musteriler where isim like 'A%';

select * from musteriler where isim ~~ 'A%';

select * from musteriler where isim ilike 'A%';

select * from musteriler where isim ~~* 'A%';

--Ismi e harfi ile biten musterilerin isimlerini ve gelir’lerini yazdiran QUERY yazin
select isim, gelir from musteriler where isim like '%e';

--Isminin icinde er olan musterilerin isimlerini ve gelir’lerini yazdiran QUERY yazin
select isim, gelir from musteriler where isim like '%er%';

-- SORU : Ismi 5 harfli olup son 4 harfi atma olan musterilerin tum bilgilerini yazdiran QUERY yazin
select * from musteriler where isim like '_atma';

--Ikinci harfi a olan musterilerin tum bilgilerini yazdiran QUERY yazin
select * from musteriler where isim like '_a%';

--Ucuncu harfi s olan musterilerin tum bilgilerini yazdiran QUERY yazin
select * from musteriler where isim like '__s%';

CREATE TABLE kelimeler  (
id int UNIQUE,
kelime varchar(50) NOT NULL,  
Harf_sayisi int
);

INSERT INTO kelimeler VALUES (1001, 'hot', 3);  
INSERT INTO kelimeler VALUES (1002, 'hat', 3);  
INSERT INTO kelimeler VALUES (1003, 'hit', 3);  
INSERT INTO kelimeler VALUES (1004, 'hbt', 3);  
INSERT INTO kelimeler VALUES (1008, 'hct', 3);  
INSERT INTO kelimeler VALUES (1005, 'adem', 4);  
INSERT INTO kelimeler VALUES (1006, 'selim', 5);  
INSERT INTO kelimeler VALUES (1007, 'yusuf', 5);

--SORU : Ilk harfi h,son harfi t olup 2.harfi a veya i olan 3 harfli kelimelerin tum bilgilerini yazdiran
select * from kelimeler where kelime ~ 'h[ai]t';

--SORU : Ilk harfi h,son harfi t olup 2.harfi a ile k arasinda olan 3 harfli kelimelerin
--tum bilgilerini  yazdiran QUERY yazin
select * from kelimeler where kelime ~* 'h[a-k]t';
-- * isareti buyuk kucuk gozetmeksizin calisir

-- icinde m veya i olan kelimelerin tum bilgilerini yazdiran sorguyu yazin
select * from kelimeler where kelime ~ '[mi]';

-- a veya s ile baslayan kelimelerin tum bilgilerini yazdiran sorguyu yazin
select * from kelimeler where kelime ~ '^[as]'

--SORU : a veya s ile baslayan kelimelerin tum bilgilerini yazdiran QUERY yazin
select * from kelimeler where kelime ~* '^[as]';

--SORU : m veya f ile biten kelimelerin tum bilgilerini yazdiran QUERY yazin
select * from kelimeler where kelime ~* '[mf]$';

/*
							LIKE Condition
LIKE: Sorgulama yaparken belirli patternleri(KAlıp ifadelerle sorgu) kullanabilmezi sağlar
ILIKE: Sorgulama yaparken büyük/küçük harfe duyarsız olarak eşleştirir.
LIKE = ~~
ILIKE = ~~*
NOT LIKE = !~~
NOT ILIKE = !~~*
NOT REGEXP_LIKE = !~*
NOT REGEXP_LIKE = !~
 */
 
 --ikinci ve ucuncu harfi 'de' olmayan kelimelerin tum bilgilerini yazdiran sorguyu yaziniz
 select * from kelimeler where kelime not like '_de%';
 
 --2. harfi e, i veya o olmayan kelimelerin tum bilgilerini yazdiran sorguyu yaziniz
 select * from kelimeler where kelime !~'[_eio]';

--kelimeler tablosundaki kelime sutunundaki verileri once hepsi buyuk harf sonra kucuk harf 
--ve ilk harfleri buyuk harf olucak sekilde yazdiralim
select upper (kelime) from kelimeler;
select lower (kelime) from kelimeler;
select initcap(kelime)from kelimeler;
--initcap istedigimiz sutundaki verilerin ilk harfini buyuk yazar

--musteriler tablosundan butun isimleri buyuk harf yapiniz
select upper (isim) from musteriler;

--eger birden fazla sutundaki verileri buyuk kucuk harf yapmak istersek
select lower (title), upper (isim) from personel;






