-- Création table Clients avec IdClient PRIMARY KEY
CREATE TABLE Clients (
  IdClient SERIAL PRIMARY KEY,
  NomClient VARCHAR(50) NOT NULL,
  PrenomClient VARCHAR(50) NOT NULL,
  AdresseClient TEXT,
  TelClient VARCHAR(20),
  EmailClient VARCHAR(100)
);

-- Vérification structure
\d Clients;

-- Exemple insertion et test
INSERT INTO Clients (NomClient, PrenomClient, AdresseClient, TelClient, EmailClient) VALUES ('Moreau', 'Anne', '9 Rue du Cleps, 31000 Toulouse', '0616273216', 'anne.moreau@orange.fr');
SELECT IdClient, NomClient FROM Clients;

