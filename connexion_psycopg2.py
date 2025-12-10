import psycopg2  # Pour importer la librairie

conn = psycopg2.connect(database="chenil_v4",
                        host="localhost",
                        user="daniel",
                        password="datascientest",
                        port="5432")
print("Connexion réussie à chenil_v4 !")

  # Créeation d'un curseur comme un "pointeur" pour exécuter SQL
cur = conn.cursor()

  # Test requête simple version Postgres
cur.execute("SELECT version();")
version = cur.fetchone()  # Récuperation de résultat
print("Version Postgres :", version[0])

# Test requête sur tes chiens pour voir le nombre ttl
cur.execute("SELECT COUNT(*) FROM Chiens;")
nb_chiens = cur.fetchone()[0]
print("Nombre de chiens dans chenil_v4 :", nb_chiens)

#Afficher les chiens TT
print("\n--- Liste complète des chiens ---")
cur.execute("SELECT * FROM Chiens;")
rows = cur.fetchall()

for row in rows:
    print(row)

# pour fermer tout
cur.close()
conn.close()
print("Connexion fermée proprement.")
