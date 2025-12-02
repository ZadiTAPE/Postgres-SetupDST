chenil_v3=# \d Chiens
                                            Table "public.chiens"
       Column       |          Type          | Collation | Nullable |                 Default                 
--------------------+------------------------+-----------+----------+-----------------------------------------
 idchien            | integer                |           | not null | nextval('chiens_idchien_seq'::regclass)
 nomchien           | character varying(255) |           |          | NULL::character varying
 racechien          | character varying(255) |           |          | NULL::character varying
 sexechien          | boolean                |           |          | 
 numtatouagechien   | integer                |           |          | 
 datenaissancechien | date                   |           |          | 
 couleurpelagechien | character varying(255) |           |          | NULL::character varying
 prixvente          | numeric(10,2)          |           |          | NULL::numeric
 datevente          | date                   |           |          | 
 idclient           | integer                |           |          | 
Indexes:
    "chiens_pkey" PRIMARY KEY, btree (idchien)
Referenced by:
    TABLE "adoptions" CONSTRAINT "adoptions_idchien_fkey" FOREIGN KEY (idchien) REFERENCES chiens(idchien)o


