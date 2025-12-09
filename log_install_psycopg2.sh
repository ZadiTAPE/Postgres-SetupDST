#!/bin/bash
# Commandes clés pour installation psycopg2 (travaux 09/12/2025)

# Dépendances Postgres (déjà OK)
sudo apt-get install libpq-dev

# Driver Python-Postgres (version 2.9.11 installée)
pip install psycopg2-binary

# Vérif
pip list | grep psycopg2  # Résultat : psycopg2-binary 2.9.11
