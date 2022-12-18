--review_questions

--1) what is the difference between delete and truncate 

--truncate ile tablonun tum satirlari silinir, delete komutu ise daha cok belli satirlari silmek icin kullanilir.

--truncate komutu ile silinen data lar geri getirilemez ama delete komutu ile silinen datalar geri getirilebilir.

--truncate komutunu where ile kullanamayiz ama delete komutunu where ile kullanabiliriz.

--2) what is the difference between delete and drop

--delete komutu bir tablodaki verileri siler drop komutu ise tabloyu tamamen siler.

--3) what is the difference between drop and drop purge

--drop tabloyu silip geri donusum kutusuna atar drop purge ise geri donusum kutusundan da siler.

--4)

select * from where age>=8 and age<=17;

select * from students where age between 8 and 17;

--5) 

select * from students where age<8 or age>17;

select * from students where age not between 8 and 17;

--6) 

select * from students where grade=6 or grade=7 or grade=8 or grade=9;

select * from students where grade in(6,7,8,9);











