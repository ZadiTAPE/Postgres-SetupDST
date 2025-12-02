-- Query 1 : Incohérences non tatoué avec numéro
SELECT NomChien, TatoueChien, NumTatouageChien FROM Chiens WHERE TatoueChien = False AND NumTatouageChien IS NOT NULL;

-- Query 2 : Tatoué sans numéro
SELECT NomChien, TatoueChien, NumTatouageChien FROM Chiens WHERE TatoueChien = True AND NumTatouageChien IS NULL;

-- Fix pour Bibi et Lucy (mettre tatoué à True)
UPDATE Chiens SET TatoueChien = True WHERE NomChien IN ('Bibi', 'Lucy') AND NumTatouageChien IS NOT NULL;

-- Fix pour Whisky (mettre non tatoué)
UPDATE Chiens SET TatoueChien = False WHERE NomChien = 'Whisky' AND NumTatouageChien IS NULL;

-- Vérif finale : Plus d'incohérences ?
SELECT NomChien, TatoueChien, NumTatouageChien FROM Chiens WHERE (TatoueChien = False AND NumTatouageChien IS NOT NULL) OR (TatoueChien = True AND NumTatouageChien IS NULL);
