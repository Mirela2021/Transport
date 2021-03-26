
--CREATE THEN USE DATA BASE TRANSPORT
--CREATE TABLE AEROPORTURI

USE Transport;
create table Aeroporturi
(oras varchar (25),
aeroport varchar (25));

alter table Aeroporturi
add
DenumireAeroport varchar (30),
AeroportID int;

truncate table Aeroporturi;
insert into Aeroporturi (oras, aeroport,DenumireAeroport,AeroportID)

values ('Viena', 'da', 'AeroportViena', 1),
       ('Cluj', 'da', 'AeroportCluj', 2),
	   ('Timisoara', 'da', 'AerportTimisoara', 3),
	   ('Borsec', 'nu', '',null) ;


create table Gari
(oras varchar (25),
gara varchar (25) );


--CREATE TABLE GARI
alter table Gari
add 
	 DenumireGara varchar (25),
	 GaraID varchar (25) ;

truncate table Gari;

insert into Gari (oras, gara, DenumireGara, GaraID) values ('Timisoara', 'da', 'Gara Timisoara', 1000);
insert into Gari (oras, gara, DenumireGara, GaraID) values ('Borsec','nu', '', null);
insert into Gari (oras, gara, DenumireGara, GaraID) values ('Bicaz', 'nu', '', null);
insert into Gari (oras, gara, DenumireGara, GaraID) values ('Ploiest','da','Gara Ploiesti', 1003);



--inner join
select DenumireGara, Gara, DenumireAeroport, Aeroport, aeroporturi.oras, Gari.oras
from Gari inner join Aeroporturi on Gari.oras=Aeroporturi.oras;

--inner join
select DenumireGara, Gara, DenumireAeroport, Aeroport, aeroporturi.oras, Gari.oras
from Aeroporturi inner join Gari on Gari.oras=Aeroporturi.oras;

--left join
select DenumireGara, Gara, DenumireAeroport, Aeroport, aeroporturi.oras, Gari.oras
from Gari left join Aeroporturi on Gari.oras=Aeroporturi.oras;

--left join
select DenumireGara, Gara, DenumireAeroport, Aeroport, aeroporturi.oras, Gari.oras
from Aeroporturi left join Gari on Gari.oras=Aeroporturi.oras;

--left join
select DenumireGara, Gara, Gari.oras, aeroporturi.oras, DenumireAeroport, Aeroport
from Gari left join Aeroporturi on Gari.oras=Aeroporturi.oras;

--inner join
select DenumireGara, Gara, Gari.oras, aeroporturi.oras, DenumireAeroport, Aeroport
from Aeroporturi inner join Gari on Gari.oras=Aeroporturi.oras;

--right join
select DenumireGara, Gara, Gari.oras, aeroporturi.oras, DenumireAeroport, Aeroport
from Gari right join Aeroporturi on Gari.oras=Aeroporturi.oras;

--right join
select aeroporturi.oras, DenumireAeroport, Aeroport, DenumireGara, Gara, Gari.oras
from Aeroporturi right join Gari on Gari.oras=Aeroporturi.oras;

--left join
select DenumireGara, Gara, Gari.oras, aeroporturi.oras, DenumireAeroport, Aeroport
from Gari left join Aeroporturi on Gari.oras=Aeroporturi.oras;

--right join
select  DenumireGara, Gara, Gari.oras, aeroporturi.oras, DenumireAeroport, Aeroport
from gari right join Aeroporturi on Gari.oras=Aeroporturi.oras;


--aeroport null
select
Gari.oras,
Gari.gara,
Gari.DenumireGara,
Aeroporturi.oras,
Aeroporturi.aeroport,
Aeroporturi.DenumireAeroport
from dbo.Gari
left join Aeroporturi on Gari.oras=Aeroporturi.oras
where dbo.Gari.gara='da' and dbo.Aeroporturi.aeroport is null;

select
Gari.oras,
Gari.gara,
Gari.DenumireGara,
Aeroporturi.oras,
Aeroporturi.aeroport,
Aeroporturi.DenumireAeroport
from Gari
left join dbo.Aeroporturi on Aeroporturi.oras=Gari.oras
where dbo.Gari.GaraID in (1000, 1003) or dbo.Aeroporturi.AeroportID=4;

--FOLOSIM BAZA DE DATE TRANSPORT
USE Transport;
SELECT ORAS, 'AEROPORT' AS [ORASE CU G SAU/SI A]
FROM AEROPORTURI
UNION 
SELECT ORAS, 'GARA' AS [ORASE CU G SAU/SI A]
FROM GARI;