## Utilisation
### Queries SQL
- Connexion : `psql -h localhost -U daniel -d chenil_v4`
- Exemples :
- Liste chiens : `SELECT * FROM Chiens LIMIT 5;`
- Audit : UPDATE un chien, puis `SELECT * FROM AuditChiens;`

### Scripts Python
- Test connexion : `python connexion_psycopg2.py` (affiche chiens).
- Graph prix : `python graph.py` (bar chart des ventes, nécessite matplotlib).

### Rôles/Users
- Nathalie : SUPERUSER (tout accès).
- Antoine : data_analyst (SELECT seulement).
- data_engineer : INSERT/UPDATE/DELETE (pour Vincent/Cassandra).

## Structure du repo
- `docker-compose.yaml` : Setup Postgres/pgAdmin.
- `chenil_v*.sql` : Schémas tables et données.
- `connexion_psycopg2.py` : Connexion/test queries.
- `travaux_*.sql` : Logs étapes (audit, rôles).
- `test_psycopg2.py` : Tests installation.

## Problèmes courants
- Erreur connexion : Vérifie Docker up (`docker ps`), mot de passe.
- Pas de données : Importe chenil_v4.sql.
- Permissions : (GRANT pour ajouter).
- 
## AUTEURS
Auteur : Zadi TAPE (Data Engineer).
Contact : zadiconsty@gmail.com
