#schemat znormalizowanym
CREATE DATABASE PROJEKT;
DROP database PROJEKT;


USE PROJEKT;
CREATE TABLE GeoEon(
id_eon INT NOT NULL ,
nazwa_eon VARCHAR(40) NOT NULL,
PRIMARY KEY (id_eon)
);
#DODANIE 
INSERT INTO GeoEon VALUES (1, 'Fanerozoik');

select * from GeoEon;


CREATE TABLE GeoEra(
id_era INT NOT NULL,
id_eon INT,
nazwa_era VARCHAR(20) NOT NULL,
CONSTRAINT fkid_eon FOREIGN KEY (id_eon) REFERENCES GeoEon(id_eon),
PRIMARY KEY (id_era)
);
#ALTER TABLE GeoEra DROP FOREIGN KEY id_eon;
#DODANIE
INSERT INTO GeoEra VALUES (1, 1, 'Paleozoik');
INSERT INTO GeoEra VALUES (2, 1, 'Mezozoik');
INSERT INTO GeoEra VALUES (3, 1, 'Kenozoik');


CREATE TABLE GeoOkres(
id_okres INT NOT NULL,
id_era INT,
nazwa_okres VARCHAR(20) NOT NULL,
CONSTRAINT fkid_era FOREIGN KEY (id_era) REFERENCES GeoEra(id_era),
PRIMARY KEY (id_okres)
);

#dodanie
INSERT INTO GeoOkres VALUES (1, 1, 'Dewon');
INSERT INTO GeoOkres VALUES (2, 1, 'Karbon');
INSERT INTO GeoOkres VALUES (3, 1, 'Perm');
INSERT INTO GeoOkres VALUES (4, 2, 'Trias');
INSERT INTO GeoOkres VALUES (5, 2, 'Jura');
INSERT INTO GeoOkres VALUES (6, 2, 'Kreda');
INSERT INTO GeoOkres VALUES (7, 3, 'Paleogen');
INSERT INTO GeoOkres VALUES (8, 3, 'Neogen');
INSERT INTO GeoOkres VALUES (9, 3, 'Czwartorzęd');


CREATE TABLE GeoEpoka(
id_epoka INT NOT NULL,
id_okres INT,
nazwa_epoka VARCHAR(20) NOT NULL,
CONSTRAINT fkid_okres FOREIGN KEY (id_okres) REFERENCES GeoOkres(id_okres),
PRIMARY KEY (id_epoka)

);

INSERT INTO GeoEpoka VALUES (1, 1, 'Dolny');
INSERT INTO GeoEpoka VALUES (2, 1, 'Środkowy');
INSERT INTO GeoEpoka VALUES (3, 1, 'Górny');
INSERT INTO GeoEpoka VALUES (4, 2, 'Dolny');
INSERT INTO GeoEpoka VALUES (5, 2, 'Górny');
INSERT INTO GeoEpoka VALUES (6, 3, 'Dolny');
INSERT INTO GeoEpoka VALUES (7, 3, 'Górny');
INSERT INTO GeoEpoka VALUES (8, 4, 'Dolna');
INSERT INTO GeoEpoka VALUES (9, 4, 'Środkowa');
INSERT INTO GeoEpoka VALUES (10, 4, 'Górna');
INSERT INTO GeoEpoka VALUES (11, 5, 'Dolna');
INSERT INTO GeoEpoka VALUES (12, 5, 'Środkowa');
INSERT INTO GeoEpoka VALUES (13, 5, 'Górna');
INSERT INTO GeoEpoka VALUES (14, 6, 'Dolna');
INSERT INTO GeoEpoka VALUES (15, 6, 'Górna');
INSERT INTO GeoEpoka VALUES (16, 7, 'Paleocen');
INSERT INTO GeoEpoka VALUES (17, 7, 'Eocen');
INSERT INTO GeoEpoka VALUES (18, 7, 'Oligocen');
INSERT INTO GeoEpoka VALUES (19, 8, 'Miocen');
INSERT INTO GeoEpoka VALUES (20, 8, 'Pliocen');
INSERT INTO GeoEpoka VALUES (21, 9, 'Plejstocen');
INSERT INTO GeoEpoka VALUES (22, 9, 'Halocen');

CREATE TABLE GeoPietro(
id_pietro INT NOT NULL,
id_epoka INT,
nazwa_pietro VARCHAR(20) NOT NULL,
CONSTRAINT fkid_epoka FOREIGN KEY (id_epoka) REFERENCES GeoEpoka(id_epoka),
PRIMARY KEY (id_pietro)

);

INSERT INTO GeoPietro VALUES (1, 1, 'Zedyn');
INSERT INTO GeoPietro VALUES (2, 1, 'Zigen');
INSERT INTO GeoPietro VALUES (3, 1, 'Ems');
INSERT INTO GeoPietro VALUES (4, 2, 'Eifel');
INSERT INTO GeoPietro VALUES (5, 2, 'Zywet');
INSERT INTO GeoPietro VALUES (6, 3, 'Fran');
INSERT INTO GeoPietro VALUES (7, 3, 'Famen');
INSERT INTO GeoPietro VALUES (8, 4, 'Turnej');
INSERT INTO GeoPietro VALUES (9, 4, 'Wizen');
INSERT INTO GeoPietro VALUES (10, 5, 'Namur');
INSERT INTO GeoPietro VALUES (11, 5, 'Westfal');
INSERT INTO GeoPietro VALUES (12, 5, 'Stefan');
INSERT INTO GeoPietro VALUES (13, 6, 'Aselsk');
INSERT INTO GeoPietro VALUES (14, 6, 'Sakmar');
INSERT INTO GeoPietro VALUES (15, 6, 'Artynsk');
INSERT INTO GeoPietro VALUES (16, 7, 'Kungur');
INSERT INTO GeoPietro VALUES (17, 7, 'Kazań');
INSERT INTO GeoPietro VALUES (18, 7, 'Tatar');
INSERT INTO GeoPietro VALUES (19, 8, 'Scytyk');
INSERT INTO GeoPietro VALUES (20, 9, 'Anizyk');
INSERT INTO GeoPietro VALUES (21, 9, 'Ladyn');
INSERT INTO GeoPietro VALUES (22, 10, 'Karnik');
INSERT INTO GeoPietro VALUES (23, 10, 'Noryk');
INSERT INTO GeoPietro VALUES (24, 10, 'Retyk');
INSERT INTO GeoPietro VALUES (25, 11, 'Hetang');
INSERT INTO GeoPietro VALUES (26, 11, 'Synemur');
INSERT INTO GeoPietro VALUES (27, 11, 'Pliensbach');
INSERT INTO GeoPietro VALUES (28, 11, 'Toark');
INSERT INTO GeoPietro VALUES (29, 12, 'Alen');
INSERT INTO GeoPietro VALUES (30, 12, 'Bajos');
INSERT INTO GeoPietro VALUES (31, 12, 'Baton');
INSERT INTO GeoPietro VALUES (32, 12, 'Kejlowej');
INSERT INTO GeoPietro VALUES (33, 13, 'Oksford');
INSERT INTO GeoPietro VALUES (34, 13, 'Kimeryd');
INSERT INTO GeoPietro VALUES (35, 13, 'Tyton');
INSERT INTO GeoPietro VALUES (36, 14, 'Berias');
INSERT INTO GeoPietro VALUES (37, 14, 'Walnzyn');
INSERT INTO GeoPietro VALUES (38, 14, 'Hoteryw');
INSERT INTO GeoPietro VALUES (39, 14, 'Barrem');
INSERT INTO GeoPietro VALUES (40, 14, 'Apt');
INSERT INTO GeoPietro VALUES (41, 14, 'Alb');
INSERT INTO GeoPietro VALUES (42, 15, 'Cynoman');
INSERT INTO GeoPietro VALUES (43, 15, 'Turon');
INSERT INTO GeoPietro VALUES (44, 15, 'Koniak');
INSERT INTO GeoPietro VALUES (45, 15, 'Santon');
INSERT INTO GeoPietro VALUES (46, 15, 'Kampan');
INSERT INTO GeoPietro VALUES (47, 15, 'Mastrycht');
INSERT INTO GeoPietro VALUES (48, 16, 'Dan');
INSERT INTO GeoPietro VALUES (49, 17, 'Tanet');
INSERT INTO GeoPietro VALUES (50, 18, 'Yprez');
INSERT INTO GeoPietro VALUES (51, 18, 'Lutet');
INSERT INTO GeoPietro VALUES (52, 18, 'Barton');
INSERT INTO GeoPietro VALUES (53, 18, 'Priabon');
INSERT INTO GeoPietro VALUES (54, 8, 'Rupel');
INSERT INTO GeoPietro VALUES (55, 8, 'Szat');
INSERT INTO GeoPietro VALUES (56, 19, 'Egger');
INSERT INTO GeoPietro VALUES (57, 19, 'Egenuburg');
INSERT INTO GeoPietro VALUES (58, 19, 'Otanang');
INSERT INTO GeoPietro VALUES (59, 19, 'Karpat');
INSERT INTO GeoPietro VALUES (60, 20, 'Baden');
INSERT INTO GeoPietro VALUES (61, 20, 'Sarmat');
INSERT INTO GeoPietro VALUES (62, 20, 'Panon');
INSERT INTO GeoPietro VALUES (63, 20, 'Pont');
INSERT INTO GeoPietro VALUES (64, 21, 'Dak');
INSERT INTO GeoPietro VALUES (65, 21, 'Roman');
INSERT INTO GeoPietro VALUES (66, 22, 'Biber');
INSERT INTO GeoPietro VALUES (67, 22, 'Biber-Donau');
INSERT INTO GeoPietro VALUES (68, 22, 'Donau');

#DELETE FROM GeoPietro
#WHERE id_pietro = '69';


#schemat zdenormalizowany
CREATE TABLE GeoTabela AS (SELECT * FROM GeoPietro NATURAL JOIN GeoEpoka NATURAL 
JOIN GeoOkres NATURAL JOIN GeoEra NATURAL JOIN GeoEon );
DROP TABLE GeoTabela;
SELECT * FROM GeoTabela;




CREATE TABLE Milion(liczba int,cyfra int, bit int);
CREATE TABLE Dziesiec(cyfra int,bit int);

insert INTO Dziesiec VALUES (0, 00000000);
insert INTO Dziesiec VALUES (1, 00000001);
insert INTO Dziesiec VALUES (2, 00000010);
insert INTO Dziesiec VALUES (3, 00000011);
insert INTO Dziesiec VALUES (4, 00000100);
insert INTO Dziesiec VALUES (5, 00000101);
insert INTO Dziesiec VALUES (6, 00000110);
insert INTO Dziesiec VALUES (7, 00000111);
insert INTO Dziesiec VALUES (8, 00001000);
insert INTO Dziesiec VALUES (9, 00001001);

INSERT INTO Milion SELECT a1.cyfra +10* a2.cyfra +100*a3.cyfra + 1000*a4.cyfra 
+ 10000*a5.cyfra + 10000*a6.cyfra AS liczba , a1.cyfra AS cyfra, a1.bit AS bit 
FROM Dziesiec a1, Dziesiec a2, Dziesiec a3, Dziesiec a4, Dziesiec a5, Dziesiec 
a6 ;

SELECT * FROM Milion;

#Zapytanie 1 ktorego celem jest złaczenie syntetycznej tablicy miliona wynikow.
SELECT COUNT(*) FROM Milion INNER JOIN GeoTabela ON 
(mod(Milion.liczba,68)=(GeoTabela.id_pietro));

#Zapytanie 2 (2 ZL), którego celem jest złączenie syntetycznej tablicy miliona wyników 
#z tabelą geochronologiczną w postaci znormalizowanej.

SELECT COUNT(*) FROM Milion INNER JOIN GeoPietro ON 
(mod(Milion.liczba,68)=GeoPietro.id_pietro) NATURAL JOIN GeoEpoka NATURAL JOIN 
GeoOkres NATURAL JOIN GeoEra NATURAL JOIN GeoEon;


#Zapytanie 3 (3 ZG), którego celem jest złączenie syntetycznej tablicy miliona wyników 
#z tabelą geochronologiczną w postaci zdenormalizowanej.

SELECT COUNT(*) FROM Milion WHERE mod(Milion.liczba,68)= 
(SELECT id_pietro FROM GeoTabela WHERE mod(Milion.liczba,68)=(id_pietro));

#Zapytanie 4 (4 ZG), którego celem jest złączenie syntetycznej tablicy miliona wyników 
#z tabelą geochronologiczną w postaci znormalizowanej.


SELECT COUNT(*) FROM Milion WHERE mod(Milion.liczba,68) IN
(SELECT GeoPietro.id_pietro FROM GeoPietro NATURAL JOIN GeoEpoka 
NATURAL JOIN GeoOkres NATURAL JOIN GeoEra NATURAL JOIN GeoEon);


DROP INDEX iNdxgeoera ON GeoEra ;
DROP INDEX iNdxgeookres ON GeoOkres;
DROP INDEX iNdxgeoepoka ON GeoEpoka;
DROP INDEX iNdxgeopietro ON GeoPietro;
CREATE INDEX iNdxgeoera ON GeoEra (id_eon);
CREATE INDEX iNdxgeookres ON GeoOkres (id_era);
CREATE INDEX iNdxgeoepoka ON GeoEpoka (id_okres);
CREATE INDEX iNdxgeopietro ON GeoPietro (id_epoka);



