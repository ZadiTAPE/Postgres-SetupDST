-- Session chenil_v5 : Création tables Clients, Chiens, Races + ajouts colonnes
-- Erreurs initiales dues à tables manquantes, corrigées par CREATE

-- Création Clients
DROP TABLE IF EXISTS Clients;
CREATE TABLE Clients (
  IdClient serial PRIMARY KEY,
  NomClient varchar(45) NOT NULL,
  PrenomClient varchar(45) NOT NULL,
  AdresseClient varchar(45) NOT NULL,
  CpClient varchar(10) NOT NULL,
  VilleClient varchar(60) NOT NULL,
  PaysClient varchar(45) NOT NULL,
  TelClient varchar(45) DEFAULT NULL,
  EmailClient varchar(45) DEFAULT NULL
);

-- Création Chiens
DROP TABLE IF EXISTS Chiens;
CREATE TABLE Chiens (
  IdChien serial PRIMARY KEY,
  NomChien varchar(45) NOT NULL,
  IdRace int DEFAULT NULL,
  SexeChien boolean DEFAULT NULL,
  NumTatouageChien varchar(45) DEFAULT NULL,
  DateNaissanceChien date DEFAULT NULL,
  CouleurPelageChien varchar(45) DEFAULT NULL,
  IdClient int DEFAULT NULL
);

-- Ajout colonnes PrixVente et DateVente
ALTER TABLE Chiens ADD PrixVente DECIMAL;
ALTER TABLE Chiens ADD DateVente DATE;

-- Création Races
DROP TABLE IF EXISTS Races;
CREATE TABLE Races (
  IdRace serial PRIMARY KEY,
  NomRace varchar(45) NOT NULL
);

-- Vérifs
\d+ Clients
\d+ Chiens
\d+ Races
