CREATE TABLE  tedarikciler
(
tedarikci_id char(5),
tedarikci_ismi char(50),
tedarikci_adres varchar(250),
ulasim_tarihi date
);

CREATE TABLE tedarikci_ziyaret
AS SELECT tedarikci_ismi,ulasim_tarihi
FROM tedarikciler;






