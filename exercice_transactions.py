import psycopg2  # Boîte à outils Postgres

try:
  # Connexion
  conn = psycopg2.connect(
    database="chenil_v4",  # Ma db4
    host="localhost",
    user="daniel",
    password="datascientest",
    port="5432"
  )
  print("Connexion réussie !")

  cur = conn.cursor()  # Pointeur pour SQL

  # Requête 1 : Clients avec chiens >500€
  print("\n--- Clients avec chiens >500€ ---")
  cur.execute("""
    SELECT * FROM Clients c
    WHERE EXISTS (
      SELECT 1 FROM Chiens ch
      WHERE ch.IdClient = c.IdClient AND ch.PrixVente > 500
    )
  """)
  rows1 = cur.fetchall()
  for row in rows1:
    print(row)

  # Requête 2 : Clients avec chiens nés en 2023 (refait l'EXISTS)
  print("\n--- Clients avec chiens nés en 2023 ---")
  cur.execute("""
    SELECT * FROM Clients c
    WHERE EXISTS (
      SELECT 1 FROM Chiens ch
      WHERE ch.IdClient = c.IdClient
      AND ch.DateNaissanceChien BETWEEN '2023-01-01' AND '2023-12-31'
    )
  """)
  rows2 = cur.fetchall()
  for row in rows2:
    print(row)

  # Exemple transaction : INSERT un chien test
  print("\n--- Test transaction INSERT ---")
  try:
    cur.execute("""
      INSERT INTO Chiens (NomChien, RaceChien, PrixVente, DateVente)
      VALUES ('TestBlacky', 'Labrador', 600.00, '2025-12-09')
    """)
    conn.commit()  # Valide l'INSERT
    print("INSERT réussi ! Chien ajouté.")
  except Exception as e:
    conn.rollback()  # Annule si erreur
    print("Erreur INSERT, annulé :", e)

  # Vérif : Compte les chiens après
  cur.execute("SELECT COUNT(*) FROM Chiens;")
  total = cur.fetchone()[0]
  print("Total chiens après :", total)

except Exception as e:
  print("Erreur générale :", e)

finally:
  cur.close()  # Pour fermer
  conn.close()
  print("Connexion fermée.")
