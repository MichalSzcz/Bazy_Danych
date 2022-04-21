--Polecenie Create DataBase
CREATE DATABASE firma_1;
--TWORZENIE SCHEMATU
CREATE SCHEMA ksiegowosc; -- dodanie schematu 

CREATE TABLE ksiegowosc.pracownicy(
id_pracownika INTEGER PRIMARY KEY NOT NULL, -- klucz podstawowy
imie NVARCHAR(50) NOT NULL,
nazwisko NVARCHAR(50) NOT NULL,
adres NVARCHAR(50) NOT NULL,
telefon CHAR(20)
);
--dodanie rekordów
SELECT * FROM ksiegowosc.pracownicy
INSERT INTO ksiegowosc.pracownicy VALUES(1,'Michal','Kowalski','Grzegorzecka 10',519456231);
INSERT INTO ksiegowosc.pracownicy VALUES(2,'Magda','Kolodziejczyk','Lobzowska 12',619456231);
INSERT INTO ksiegowosc.pracownicy VALUES(3,'Marcin','Pastuszka','Lisiecka 40',719456231);
INSERT INTO ksiegowosc.pracownicy VALUES(4,'Marian','Swica','Kosciuszki 12',519456231);
INSERT INTO ksiegowosc.pracownicy VALUES(5,'Ewa','Liberacka','Krolowej Jadwigi 8',543256231);
INSERT INTO ksiegowosc.pracownicy VALUES(6,'Malgorzata','Bochenek','Salwatorska 15',521456231);
INSERT INTO ksiegowosc.pracownicy VALUES(7,'Maciej','Drugi','Jana Pawla  10/20a',574536231);
INSERT INTO ksiegowosc.pracownicy VALUES(8,'Jakub','Adamowicz','Warszawska 150',519474234);
INSERT INTO ksiegowosc.pracownicy VALUES(9,'Grzegorz','Kierzkowski','Wroclawska 11',550159631);
INSERT INTO ksiegowosc.pracownicy VALUES(10,'Kamil','Posel','Karmelicka 15/10c',879653231);






CREATE TABLE ksiegowosc.godziny(

id_godziny INTEGER PRIMARY KEY NOT NULL,
data_ NVARCHAR(50) NOT NULL,
liczba_godzin INT,
id_pracownika INT NOT NULL,
CONSTRAINT fk_id_praco FOREIGN KEY (id_pracownika) REFERENCES ksiegowosc.pracownicy(id_pracownika)
--klucz obcy fk_id_praco id_pracownika 

);

--dodanie rekordow
INSERT INTO ksiegowosc.godziny VALUES(1,'05.04.2022',10,1);
INSERT INTO ksiegowosc.godziny VALUES(2,'06.04.2022',50,2);
INSERT INTO ksiegowosc.godziny VALUES(3,'07.04.2022',15,3);
INSERT INTO ksiegowosc.godziny VALUES(4,'08.04.2022',100,4);
INSERT INTO ksiegowosc.godziny VALUES(5,'09.04.2022',170,5);
INSERT INTO ksiegowosc.godziny VALUES(6,'10.04.2022',120,6);
INSERT INTO ksiegowosc.godziny VALUES(7,'11.04.2022',130,7);
INSERT INTO ksiegowosc.godziny VALUES(8,'12.04.2022',210,8);
INSERT INTO ksiegowosc.godziny VALUES(9,'13.04.2022',90,9);
INSERT INTO ksiegowosc.godziny VALUES(10,'14.04.2022',80,10);




CREATE TABLE ksiegowosc.pensje(
id_pensji INT NOT NULL,
stanowisko NVARCHAR(100)NOT NULL,
kwota FLOAT PRIMARY KEY NOT NULL,
CONSTRAINT fk_id_pensji FOREIGN KEY (id_pensji) REFERENCES ksiegowosc.pracownicy(id_pracownika)
-- klucz obcy fk_id_pensji

--zamiana pola kwota z float na int:
ALTER TABLE ksiegowosc.pensje ALTER COLUMN liczba_godzin TYPE INT ;
); 

--dodanie rekordow
INSERT INTO ksiegowosc.pensje VALUES(1,'CEO',15000);
INSERT INTO ksiegowosc.pensje VALUES(2,'Kierownik',8000);
INSERT INTO ksiegowosc.pensje VALUES(3,'senior developer',10000);
INSERT INTO ksiegowosc.pensje VALUES(4,'senior developer',11000);
INSERT INTO ksiegowosc.pensje VALUES(5,'junior developer',4000);
INSERT INTO ksiegowosc.pensje VALUES(6,'junior developer',4100);
INSERT INTO ksiegowosc.pensje VALUES(7,'Staz',1000);
INSERT INTO ksiegowosc.pensje VALUES(8,'Staz',1200);
INSERT INTO ksiegowosc.pensje VALUES(9,'Staz',300);
INSERT INTO ksiegowosc.pensje VALUES(10,'Staz',1230);

CREATE TABLE ksiegowosc.premie(
id_premii INTEGER PRIMARY KEY NOT NULL,
rodzaj NVARCHAR(30) ,
kwota INT NOT NULL,
CONSTRAINT fk_kwota FOREIGN KEY (kwota) REFERENCES ksiegowosc.pensje(kwota),
--klucz obcy fk_kwota
);

INSERT INTO ksiegowosc.premie VALUES(1,'brak',15000);
INSERT INTO ksiegowosc.premie VALUES(2,'',8000);
INSERT INTO ksiegowosc.premie VALUES(3,'dodatkowe',10000);
INSERT INTO ksiegowosc.premie VALUES(4,'dodatkowe',11000);
INSERT INTO ksiegowosc.premie VALUES(5,'dodatkowe',4000);
INSERT INTO ksiegowosc.premie VALUES(6,'',4100);
INSERT INTO ksiegowosc.premie VALUES(7,'',1000);
INSERT INTO ksiegowosc.premie VALUES(8,'',1200);
INSERT INTO ksiegowosc.premie VALUES(9,'',300);
INSERT INTO ksiegowosc.premie VALUES(10,'dodatkowe',1230);


CREATE TABLE ksiegowosc.wynagrodzenie(
id_wynagrodzenia INTEGER PRIMARY KEY NOT NULL,
data_ NVARCHAR(50), 
id_pracownika INT NOT NULL, 
id_godziny NVARCHAR(30) NOT NULL, 
id_pensji INT NOT NULL, 
id_premii INT NOT NULL, 
CONSTRAINT fk_id_wyna FOREIGN KEY (id_wynagrodzenia) REFERENCES ksiegowosc.pracownicy (id_pracownika),
CONSTRAINT fk_id_pracownika FOREIGN KEY (id_pracownika) REFERENCES ksiegowosc.pracownicy (id_pracownika),

CONSTRAINT fk_id_premii FOREIGN KEY (id_premii) REFERENCES ksiegowosc.premie (id_premii),
--dodanie paru kluczy obcych, by calosc byla spójna 

);

SELECT * FROM ksiegowosc.wynagrodzenie
INSERT INTO ksiegowosc.wynagrodzenie VALUES(1,'08.04.2022',1,1,1,1);
INSERT INTO ksiegowosc.wynagrodzenie VALUES(2,'08.04.2022',2,2,2,2);
INSERT INTO ksiegowosc.wynagrodzenie VALUES(3,'08.04.2022',3,3,3,3);
INSERT INTO ksiegowosc.wynagrodzenie VALUES(4,'08.04.2022',4,4,4,4);
INSERT INTO ksiegowosc.wynagrodzenie VALUES(5,'08.04.2022',5,5,5,5);
INSERT INTO ksiegowosc.wynagrodzenie VALUES(6,'08.04.2022',6,6,6,6);
INSERT INTO ksiegowosc.wynagrodzenie VALUES(7,'08.04.2022',7,7,7,7);
INSERT INTO ksiegowosc.wynagrodzenie VALUES(8,'08.04.2022',8,8,8,8);
INSERT INTO ksiegowosc.wynagrodzenie VALUES(9,'08.04.2022',9,9,9,9);
INSERT INTO ksiegowosc.wynagrodzenie VALUES(10,'08.04.2022',10,10,10,10);




--a)

SELECT id_pracownika,nazwisko
FROM ksiegowosc.pracownicy

--b) id pracownika, ktorych placa jest wieksza niz 1000


SELECT id_pracownika
FROM ksiegowosc.pracownicy,ksiegowosc.pensje
WHERE kwota > 1000.0;


--c) Wyœwietl id pracowników nieposiadaj¹cych premii, których p³aca jest wiêksza ni¿ 2000. 
SELECT id_pracownika
FROM ksiegowosc.pracownicy,ksiegowosc.premie
WHERE rodzaj = 'brak' AND kwota > 2000



--d)  Wyœwietl pracowników, których pierwsza litera imienia zaczyna siê na literê ‘J’. 

SELECT
imie

FROM
ksiegowosc.pracownicy
WHERE
imie LIKE 'J%'
-- symbol dowolnego ciagu znakow to *

--e)Wyœwietl pracowników, których nazwisko zawiera literê ‘n’ oraz imiê koñczy siê na literê ‘a’.
SELECT
imie,nazwisko
FROM
ksiegowosc.pracownicy
WHERE
imie LIKE '*a' and nazwisko LIKE 'n*'


--f) Wyœwietl imiê i nazwisko pracowników oraz liczbê ich nadgodzin, przyjmuj¹c, i¿ standardowy czas  pracy to 160 h miesiêcznie
SELECT 
imie,nazwisko,liczba_godzin
FROM ksiegowosc.pracownicy,ksiegowosc.godziny
WHERE liczba_godzin > 160


--g)Wyœwietl imiê i nazwisko pracowników, których pensja zawiera siê w przedziale 1500 – 3000 PLN.
SELECT 
imie,nazwisko
FROM ksiegowosc.pracownicy,ksiegowosc.pensje
WHERE kwota >= 1500 AND kwota <= 3000

--h)Wyœwietl imiê i nazwisko pracowników, którzy pracowali w nadgodzinach i nie otrzymali premii.
SELECT 
imie,nazwisko
FROM ksiegowosc.pracownicy,ksiegowosc.godziny,ksiegowosc.premie
WHERE liczba_godzin>150 AND rodzaj= ''

--i)Uszereguj pracowników wed³ug pensji.
SELECT 
imie,nazwisko,kwota
FROM ksiegowosc.pracownicy,ksiegowosc.pensje
ORDER BY kwota

--j) Uszereguj pracowników wed³ug pensji i premii malej¹co.

-- wedlug pensji
SELECT w.id_pracownika, p.kwota 
FROM ksiegowosc.wynagrodzenie w
JOIN ksiegowosc.pensje p ON w.id_pensji = p.id_pensji ORDER BY p.kwota DESC
-- DESC - malej¹co, ASC - rosn¹co (wartoœæ domyœlna).

--wg premii
--p premia -w wynuik

SELECT w.id_pracownika, p.kwota 
FROM ksiegowosc.wynagrodzenie w
JOIN ksiegowosc.premie p ON w.id_premii = p.id_premii ORDER BY p.kwota DESC

--k)Zlicz i pogrupuj pracowników wed³ug pola ‘stanowisko’
SELECT stanowisko, COUNT(stanowisko) as ilosc
FROM ksiegowosc.pensje
GROUP BY stanowisko
-- uzylem COUNT(stanowisko) do wyliczenia

--l)Policz œredni¹, minimaln¹ i maksymaln¹ p³acê dla stanowiska ‘kierownik’ (je¿eli takiego nie masz, to przyjmij dowolne inne).
SELECT p.stanowisko, AVG (p.kwota) AS srednia_kwota, MIN(p.kwota) AS minimalna_kwota, MAX(p.kwota) AS maksymalna_kwota 
FROM ksiegowosc.pensje p
JOIN ksiegowosc.wynagrodzenie w ON p.id_pensji = w.id_pensji
GROUP BY p.stanowisko HAVING p.stanowisko = 'Kierownik'
-- w wynagrodzeni, p pensja
--m)przyjmij dowolne inne).

--zastosowalem AVG MIN MAX ORAZ JOIN  GROUP BY ORAZ HAVING
-- HAVING TO ODPOWIEDNIK WHERE . POLECENIE POZWALA NA OKRESLENIE DODATKOWEGO WARUNKU
--(odpowiednik WHERE). Polecenie to pozwala okreœliæ dodatkowy warunek, 
--który musi spe³niæ krotka grupy, aby pojawi³a siê w wyniku zapytania.
SELECT p.stanowisko, AVG (p.kwota) AS srednia_kwota, MIN(p.kwota) AS minimalna_kwota, MAX(p.kwota) AS maksymalna_kwota 
FROM ksiegowosc.pensje p
JOIN ksiegowosc.wynagrodzenie w ON p.id_pensji = w.id_pensji
GROUP BY p.stanowisko HAVING p.stanowisko = 'Staz'
--f)Policz sumê wynagrodzeñ w ramach danego stanowiska.SELECT p.stanowisko, SUM (p.kwota) AS suma_wynagrodzen 
FROM ksiegowosc.wynagrodzenie w
JOIN ksiegowosc.pensje p ON w.id_pensji = p.id_pensji
GROUP BY p.stanowisko--g)Wyznacz liczbê premii przyznanych dla pracowników danego stanowiska.SELECT stanowisko, COUNT(pre.id_premii) AS ilosc_premii_dla_danego_stanowiska
FROM ksiegowosc.wynagrodzenie wyn
JOIN ksiegowosc.pensje pen ON wyn.id_pensji = pen.id_pensji
JOIN ksiegowosc.premie pre ON wyn.id_premii = pre.id_premii
GROUP BY pen.stanowisko--h) Usuñ wszystkich pracowników maj¹cych pensjê mniejsz¹ ni¿ 1200 z³.--zastosowalem zapytanie zagniezdzone i JOIN
SELECT * FROM ksiegowosc.wynagrodzenie w 
JOIN ksiegowosc.pracownicy prac ON prac.id_pracownika = w.id_pracownika
JOIN ksiegowosc.pensje p ON w.id_pensji = p.id_pensji 
WHERE p.kwota < 1200