--ulusal_hasta_kayit_veriTabani

--1) 
create table hastaneler(
id char(4) primary key,
isim varchar(50),
sehir varchar(20),
ozel char(1)
);

insert into hastaneler values('H101','ACI MADEM HASTANESI','ISTANBUL','Y');
insert into hastaneler values('H102','HASZEKI HASTANESI','ISTANBUL','N');
insert into hastaneler values('H103','MEDIKOL HASTANESI','ISTANBUL','Y');
insert into hastaneler values('H104','NEMORYIL HASTANESI','ISTANBUL','Y');

--2) 
create table hastalar(
kimlik_no char(11) primary key,
isim varchar(50),
teshis varchar(20)
);

insert into hastalar values('12345678901','Ali Can','Gizli Seker');
insert into hastalar values('45678901121','Ayse Yilmaz','Hipertansiyon');
insert into hastalar values('78901123451','Steve Job','Pankreatit');
insert into hastalar values('12344321251','Tom Hanks','COVID 19');

--3) 
create table bolumler(
bolum_id varchar(10) primary key,
bolum_adi varchar(50)
);

insert into bolumler values('DHL','Dahiliye');
insert into bolumler values('KBB','Kulak-Burun-Bogaz');
insert into bolumler values('NRJ','Noroloji');
insert into bolumler values('GAST','Gastoroloji');
insert into bolumler values('KARD','Kardioloji');
insert into bolumler values('PSK','Psikiyatri');
insert into bolumler values('GOZ','Goz Hastaliklari');

--4) 
drop table hasta_kayitlar;
create table hasta_kayitlar(
kimlik_no char(11) primary key,
hast_isim varchar(20),
hastane_adi varchar(50),
bolum_adi varchar(50),
teshis varchar(20)
);

insert into hasta_kayitlar(kimlik_no) values('1111');
insert into hasta_kayitlar(kimlik_no) values('2222');
insert into hasta_kayitlar(kimlik_no) values('3333');

update hasta_kayitlar set hast_isim='NONAME';

--5) 
update hasta_kayitlar 
set hast_isim='Salvadore Dali', hastane_adi='John Hopins', bolum_adi='Noroloji', teshis='Parkinson', kimlik_no='99991111222'
where kimlik_no='3333';

update hasta_kayitlar set hast_isim='Salvadore' where hastane_adi='John Hopins';

select * from hasta_kayitlar;

--5) 
update hasta_kayitlar set hast_isim=(select isim from hastalar where kimlik_no='12345678901') where kimlik_no='1111';

update hasta_kayitlar set hastane_adi=(select isim from hastaneler where id='H104') where kimlik_no='1111';

update hasta_kayitlar set bolum_adi=(select bolum_adi from bolumler where bolum_id='DHL') where kimlik_no='12345678901';

update hasta_kayitlar set teshis=(select teshis from hastalar where isim='Ali Can') where kimlik_no='1111';

update hasta_kayitlar set kimlik_no=(select kimlik_no from hastalar where isim='Ali Can') where kimlik_no='1111';

--6) 

update hasta_kayitlar set hast_isim=(select isim from hastalar where isim='Ayse Yilmaz') where kimlik_no='2222';

update hasta_kayitlar set hastane_adi=(select isim from hastaneler where id='H103') where kimlik_no='2222';

update hasta_kayitlar set bolum_adi=(select bolum_adi from bolumler where bolum_id='KBB') where kimlik_no='2222';

update hasta_kayitlar set teshis=(select teshis from hastalar where isim='Tom Hanks') where kimlik_no='2222';

update hasta_kayitlar set kimlik_no=(select kimlik_no from hastalar where isim='Steve Job') where kimlik_no='2222';













