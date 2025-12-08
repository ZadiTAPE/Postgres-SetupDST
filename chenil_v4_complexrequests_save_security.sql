-- Travaux 08/12/2025 : chenil_v4 - Audit, rôles, users, grants, revokes

-- Création AuditChiens
DROP TABLE IF EXISTS AuditChiens;
CREATE TABLE AuditChiens (
  IdChien serial PRIMARY KEY,
  NomChien varchar(45) NOT NULL,
  IdRace int DEFAULT NULL,
  SexeChien boolean DEFAULT NULL,
  NumTatouageChien varchar(45) DEFAULT NULL,
  DateNaissanceChien date DEFAULT NULL,
  CouleurPelageChien varchar(45) DEFAULT NULL,
  IdClient int DEFAULT NULL,
  PrixVente decimal(10,0) DEFAULT NULL,
  DateVente date DEFAULT NULL,
  DateModification timestamp
);

-- Fonction et trigger audit
CREATE OR REPLACE FUNCTION audit_chien_update() RETURNS TRIGGER AS $$  
BEGIN
  INSERT INTO AuditChiens (...) VALUES (OLD...., NOW());
  RETURN NEW;
END;
  $$ LANGUAGE plpgsql;
CREATE TRIGGER before_update_chiens BEFORE UPDATE ON Chiens FOR EACH ROW EXECUTE FUNCTION audit_chien_update();

-- Test audit
UPDATE Chiens SET PrixVente = 999 WHERE IdChien = 1;
SELECT * FROM AuditChiens;

-- Création users/rôles
CREATE USER Nathalie SUPERUSER;
DROP USER IF EXISTS Nathalie;
CREATE ROLE Antoine WITH LOGIN PASSWORD 'Brown';
GRANT ALL ON ALL TABLES IN SCHEMA public TO Antoine;
GRANT ALL ON ALL SEQUENCES IN SCHEMA public TO Antoine;
GRANT ALL ON ALL FUNCTIONS IN SCHEMA public TO Antoine;

-- Tests permissions (comme Antoine)
-- INSERT OK, DROP ERROR (must be owner)

-- Revokes
REVOKE ALL PRIVILEGES ON ALL TABLES IN SCHEMA public FROM Antoine;
REVOKE ALL PRIVILEGES ON ALL SEQUENCES IN SCHEMA public FROM Antoine;
REVOKE ALL PRIVILEGES ON ALL FUNCTIONS IN SCHEMA public FROM Antoine;

-- Rôles data_analyst et data_engineer
CREATE ROLE data_analyst;
GRANT SELECT ON TABLE Chiens TO data_analyst;
GRANT data_analyst TO Antoine;

CREATE ROLE data_engineer;
GRANT SELECT, INSERT, UPDATE, DELETE ON ALL TABLES IN SCHEMA public TO data_engineer;
GRANT ALL ON ALL SEQUENCES IN SCHEMA public TO data_engineer;
GRANT ALL ON ALL FUNCTIONS IN SCHEMA public TO data_engineer;
ALTER USER data_engineer CREATEDB;

-- Users Vincent et Cassandra
CREATE ROLE Vincent WITH LOGIN PASSWORD 'judorange456';
CREATE ROLE Cassandra WITH LOGIN PASSWORD 'not_column_oriented321';
GRANT data_engineer TO Vincent;
GRANT data_engineer TO Cassandra;

-- Vérifs
\du  # Liste rôles
\dp  # Privilèges tables
