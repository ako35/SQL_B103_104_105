drop table if exists ogrenciler2;

create table ogrenciler2(
id serial,
isim varchar(50),
veli_isim varchar(50),
yazili_notu real
);

begin;

insert into ogrenciler2 values(default,'Ali Can', 'Hasan', 75.5);
insert into ogrenciler2 values(default,'Merve Gul', 'Ayse', 85.3);

savepoint x;

insert into ogrenciler2 values(default, 'Kemal Yasa', 'Hasan',85.6);
insert into ogrenciler2 values(default, 'Nesibe Yilmaz', 'Ayse',95.3); 

savepoint y;

insert into ogrenciler2 values(default, 'Mustafa Bak', 'Can',99);
insert into ogrenciler2 values(default, 'Can Bak', 'Ali',67.5); 

rollback to y;

commit;

select * from ogrenciler2;





