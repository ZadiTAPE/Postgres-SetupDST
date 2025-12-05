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
