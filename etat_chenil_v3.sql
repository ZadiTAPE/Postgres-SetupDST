-- Switch vers chenil_v3
\c chenil_v3

-- Liste des tables
\dt
-- Résultat :
--          List of relations
--  Schema | Name | Type | Owner
-- ---------+------+-------+--------
--  public | chiens | table | daniel
--  public | clients | table | daniel
-- (2 rows)

-- Description table Chiens
\d+ Chiens
-- Résultat :
--                                                                       Table "public.chiens"
--        Column | Type | Collation | Nullable | Default | Storage | Compression | Stats target | Description
-- ----------------+------------------------+-----------+----------+-----------------------------------------+----------+-------------+--------------+-------------
--  idchien | integer | | not null | nextval('chiens_idchien_seq'::regclass) | plain | | |
--  nomchien | character varying(255) | | | NULL::character varying | extended | | |
--  racechien | character varying(255) | | | NULL::character varying | extended | | |
--  sexechien | boolean | | | | plain | | |
--  tatouechien | boolean | | | | plain | | |
--  numtatouagechien | integer | | | | plain | | |
--  datenaissancechien | date | | | | plain | | |
--  couleurpelagechien | character varying(255) | | | NULL::character varying | extended | | |
--  prixvente | numeric(10,2) | | | NULL::numeric | main | | |
--  datevente | date | | | | plain | | |
--  idclient | integer | | | | plain | | |
-- Indexes:
--     "chiens_pkey" PRIMARY KEY, btree (idchien)
-- Access method: heap
