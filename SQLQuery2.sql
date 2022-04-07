USE firma;
GO
--Polecenie Create DataBase
CREATE DATABASE firma;
--TWORZENIE SCHEMATU
CREATE SCHEMA rozliczenia;

--Tworzenie tabeli // nvarchar znaki inne niz ang
CREATE TABLE rozliczenia.pracownicy(
id_pracownika INTEGER PRIMARY KEY NOT NULL,
imie NVARCHAR(50) NOT NULL,
nazwisko NVARCHAR(50) NOT NULL,
adres NVARCHAR(50) NOT NULL,
telefon CHAR(20)
);

SELECT * FROM rozliczenia.pracownicy -- wypisuje wszystkie rekordy i wiersze z tej tabeli

INSERT INTO rozliczenia.pracownicy VALUES(1,'Michal','Kowalski','Grzegorzecka 10',519456231);
INSERT INTO rozliczenia.pracownicy VALUES(2,'Magda','Kolodziejczyk','Lobzowska 12',619456231);
INSERT INTO rozliczenia.pracownicy VALUES(3,'Marcin','Pastuszka','Lisiecka 40',719456231);
INSERT INTO rozliczenia.pracownicy VALUES(4,'Marian','Swica','Kosciuszki 12',519456231);
INSERT INTO rozliczenia.pracownicy VALUES(5,'Ewa','Liberacka','Krolowej Jadwigi 8',543256231);
INSERT INTO rozliczenia.pracownicy VALUES(6,'Malgorzata','Bochenek','Salwatorska 15',521456231);
INSERT INTO rozliczenia.pracownicy VALUES(7,'Maciej','Drugi','Jana Pawla  10/20a',574536231);
INSERT INTO rozliczenia.pracownicy VALUES(8,'Jakub','Adamowicz','Warszawska 150',519474234);
INSERT INTO rozliczenia.pracownicy VALUES(9,'Grzegorz','Kierzkowski','Wroclawska 11',550159631);
INSERT INTO rozliczenia.pracownicy VALUES(10,'Kamil','Posel','Karmelicka 15/10c',879653231);

CREATE TABLE rozliczenia.godziny(

id_godziny NVARCHAR(30) NOT NULL,
data_ NVARCHAR(50),
liczba_godzin INT,
id_pracownika INTEGER PRIMARY KEY NOT NULL,
);--klucz obcy
 


ALTER TABLE rozliczenia.godziny DROP COLUMN data_;


SELECT * FROM rozliczenia.godziny

INSERT INTO rozliczenia.godziny VALUES(1,'05.04.2022',10,1);
INSERT INTO rozliczenia.godziny VALUES(2,'06.04.2022',50,2);
INSERT INTO rozliczenia.godziny VALUES(3,'07.04.2022',15,3);
INSERT INTO rozliczenia.godziny VALUES(4,'08.04.2022',100,4);
INSERT INTO rozliczenia.godziny VALUES(5,'09.04.2022',150,5);
INSERT INTO rozliczenia.godziny VALUES(6,'10.04.2022',120,6);
INSERT INTO rozliczenia.godziny VALUES(7,'11.04.2022',130,7);
INSERT INTO rozliczenia.godziny VALUES(8,'12.04.2022',110,8);
INSERT INTO rozliczenia.godziny VALUES(9,'13.04.2022',90,9);
INSERT INTO rozliczenia.godziny VALUES(10,'14.04.2022',80,10);

CREATE TABLE rozliczenia.pensje(
id_pensji INTEGER PRIMARY KEY NOT NULL,
stanowisko NVARCHAR(100)NOT NULL,
kwota FLOAT,
id_premii INT NOT NULL,
CONSTRAINT fkID FOREIGN KEY (id_pensji) REFERENCES rozliczenia.godziny(id_pracownika) -- definicja klucza ocb
); 


SELECT * FROM rozliczenia.pensje

INSERT INTO rozliczenia.pensje VALUES(1,'CEO',15000.0,1,11550);
INSERT INTO rozliczenia.pensje VALUES(2,'Kierownik',8000.0,2,6160);
INSERT INTO rozliczenia.pensje VALUES(3,'senior developer',10000.0,3,7700);
INSERT INTO rozliczenia.pensje VALUES(4,'senior developer',11000.0,4,8470);
INSERT INTO rozliczenia.pensje VALUES(5,'junior developer',4000.0,5,3080);
INSERT INTO rozliczenia.pensje VALUES(6,'junior developer',4000.0,6,3080);
INSERT INTO rozliczenia.pensje VALUES(7,'Staz',3000.0,7,2310);
INSERT INTO rozliczenia.pensje VALUES(8,'Staz',3000.0,8,2310);
INSERT INTO rozliczenia.pensje VALUES(9,'Staz',3000.0,9,2310);
INSERT INTO rozliczenia.pensje VALUES(10,'Staz',3000.0,10,2310);




 


CREATE TABLE rozliczenia.premie(
id_premii INTEGER PRIMARY KEY NOT NULL,
rodzaj NVARCHAR(30) NOT NULL,
kwota FLOAT,
);
SELECT * FROM rozliczenia.premie
INSERT INTO rozliczenia.premie VALUES(1,'brak',1.0);
INSERT INTO rozliczenia.premie VALUES(2,'brak',1.0);
INSERT INTO rozliczenia.premie VALUES(3,'dodatkowe',1.2);
INSERT INTO rozliczenia.premie VALUES(4,'dodatkowe',1.2);
INSERT INTO rozliczenia.premie VALUES(5,'dodatkowe',1.2);
INSERT INTO rozliczenia.premie VALUES(6,'brak',1.0);
INSERT INTO rozliczenia.premie VALUES(7,'brak',1.0);
INSERT INTO rozliczenia.premie VALUES(8,'brak',1.0);
INSERT INTO rozliczenia.premie VALUES(9,'brak',1.0);
INSERT INTO rozliczenia.premie VALUES(10,'dodatkowe',1.2);

--5.
SELECT nazwisko,adres
FROM rozliczenia.pracownicy

--6.



SELECT DATEPART(MONTH,data_) AS miesiac,
DATEPART(DAY,data_) AS dzien
FROM rozliczenia.godziny

--7.

ALTER TABLE rozliczenia.pensje ADD  kwota_netto FLOAT; -- dodanie kolumny kwota_netto

-- jak zmienic nazwe kolumny ??? tutaj zmienilem przez zwykle klikniecie 
-- tak samo z wstawieniem wartosci

