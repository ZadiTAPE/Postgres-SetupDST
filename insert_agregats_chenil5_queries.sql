-- Session chenil_v4 - 06/12/2025 : JOINs, inserts et stats sur chiens/clients
-- Docker : exec -it pg_container bash ; psql -h localhost -U daniel chenil_v4
-- J'ai testé INNER/LEFT pour les relations réelles.

-- Test brut 
SELECT Nomchien, PrenomClient, NomClient FROM Chiens, Clients;

-- INNER JOIN Chiens-Clients (seulement les matchs via IdClient)
SELECT Chiens.Nomchien, Clients.PrenomClient, Clients.NomClient 
FROM Chiens INNER JOIN Clients ON Chiens.IdClient = Clients.IdClient;

-- Multi-JOIN avec Races (nom chien + race + client)
SELECT Chiens.Nomchien, Races.NomRace, Clients.PrenomClient, Clients.NomClient 
FROM Chiens INNER JOIN Clients ON Chiens.IdClient = Clients.IdClient 
INNER JOIN Races ON Chiens.IdRace = Races.IdRace;

-- LEFT JOIN (tous clients, chiens optionnels - Vincent sans toutou !)
SELECT Clients.PrenomClient, Clients.NomClient, Chiens.NomChien 
FROM Clients LEFT OUTER JOIN Chiens ON Chiens.IdClient = Clients.IdClient;

-- Alias et CONCAT pour nom complet (plus lisible)
SELECT CONCAT(Clients.PrenomClient, ' ', Clients.NomClient) AS Client, 
       Chiens.NomChien AS Chien, Races.NomRace AS Race 
FROM Clients cl LEFT OUTER JOIN Chiens ch ON ch.IdClient = cl.IdClient 
LEFT OUTER JOIN Races r ON ch.IdRace = r.IdRace;

-- Agrégats
SELECT COUNT(*) FROM Chiens;  -- Total chiens : 21
SELECT COUNT(NumTatouageChien) AS "Chiens tatoués" FROM Chiens;  -- 9, pas mal
SELECT AVG(PrixVente) FROM Chiens WHERE SexeChien = true AND date_part('year', DateVente) = 2023;  -- Moyenne mâles 2023
SELECT MAX(DateNaissanceChien) AS "Le p'tit jeune" FROM Chiens;  -- 2023, pas de boomers !

-- Insert test (Vincent Drier ajouté)
INSERT INTO Clients (nomclient, prenomclient, adresseclient, cpclient, villeclient, paysclient) 
VALUES ('Drier', 'Vincent', '10 impasse des Pigeons', '58000', 'Mesvre', 'France');

-- Dump tables pour ref (copié de \d+)
-- Clients : idclient serial PK, nom/prenom/adresse etc. varchar(45), 13 rows
-- Chiens : idchien serial PK, nomchien varchar(45), idrace/int, sexechien bool, etc., 21 rows
