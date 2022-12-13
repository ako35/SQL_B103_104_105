--//1. Örnek: Prepared statement kullanarak company adı IBM olan number_of_employees değerini 9999 olarak güncelleyin.

update companies set number_of_employees=9999 where company='IBM';

create or replace function toplamaF(x numeric, y numeric) returns numeric language plpgsql as 
$$
begin

return x+y;

end
$$

select * from toplamaF(4,6);

--//1.Adım: Function kodunu yaz:
CREATE OR REPLACE FUNCTION  konininHacmiF(r NUMERIC, h NUMERIC)
RETURNS NUMERIC
LANGUAGE plpgsql
AS
$$
BEGIN
        
RETURN 3.14*r*r*h/3;
        
END
$$




