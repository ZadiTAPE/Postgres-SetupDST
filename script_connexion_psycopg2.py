import psycopg2  # Importe la librairie

# Initialisation de la connexion
try:
  conn = psycopg2.connect(
    database="chenil_v4",      
    host="localhost",         
    user="daniel",             
    password="datascientest", 
    port="5432"
  )
  print("Connexion réussie à chenil_v4 !")

  # Curseur (pointeur pour exécuter SQL)
  cur = conn.cursor()

  # Requête test 1 : Ma Version de la DB
  cur.execute("SELECT version();")
  version = cur.fetchone()[0]  # Récuperer la première ligne
  print("Version Postgres :", version)

  # Requête test 2 : Nombre de chiens
  cur.execute("SELECT COUNT(*) FROM Chiens;")
  nb_chiens = cur.fetchone()[0]
  print("Nombre de chiens :", nb_chiens)

  # Requête test 3 : Liste quelques chiens (pour Antoine)
  print("\n--- Exemple de chiens pour dashboard ---")
  cur.execute("SELECT IdChien, NomChien, PrixVente FROM Chiens LIMIT 5;")
  rows = cur.fetchall()  # pour récupèrer toutes les lignes
  for row in rows:
    print(row)  # Affiche chaque ligne (tuple)

  # Pour fermer la connexion
  cur.close()
  conn.close()
  print("Connexion fermée proprement.")

except Exception as e:
  print("Erreur :", e)