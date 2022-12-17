drop table if exists personel;

create table personel1(
id int,
isim varchar(50),
sehir varchar(50),
maas int,
sirket varchar(20),
constraint personel1_pk primary key(id)
);

insert into personel1 values(123456789,'Ali Yilmaz', 'Istanbul', 5500, 'Honda');
insert into personel1 values(234567890,'Veli Sahin', 'Istanbul', 4500, 'Toyota');
insert into personel1 values(345678901,'Mehmet Ozturk', 'Ankara', 3500, 'Honda');
insert into personel1 values(456789012,'Mehmet Ozturk', 'Izmir', 6000, 'Ford');
insert into personel1 values(567890123,'Mehmet Ozturk', 'Ankara', 7000, 'Tofas');
insert into personel1 values(456715012,'Veli Sahin', 'Ankara', 4500, 'Ford');
insert into personel1 values(123456710,'Hatice Sahin', 'Bursa', 4500, 'Honda');

select * from personel1;

alter table personel1 add ulke_isim varchar(20) default 'Turkiye';

alter table personel1 add cinsiyet varchar(20), add yas int;

alter table personel1 drop column yas;

alter table personel1 rename column ulke_isim to ulke_adi;

alter table personel1 rename to isciler;

select * from isciler;

alter table isciler 
alter column ulke_adi type varchar(30), 
alter column ulke_adi set not null;

update isciler set cinsiyet='1' where maas>4500;

alter table isciler alter column cinsiyet type int using(cinsiyet::int);







