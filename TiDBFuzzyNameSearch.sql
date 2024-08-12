/* Enter "USE {database};" to start exploring your data.
   Press Ctrl + I to try out AI-generated SQL queries or SQL rewrite using Chat2Query. */
USE test;

CREATE TABLE FuzzyNameSearch (
    FullName varchar(400),
    embedding VECTOR(26) COMMENT "hnsw(distance=cosine)"
  /* COMMENT "hnsw(distance=l2) For L2 Distance*/
);


SELECT FullName,Vec_Cosine_distance(embedding, '[1, 0, 0, 1, 1, 2, 0, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 1, 0, 0, 0, 0]') 
  FROM FuzzyNameSearch
where Vec_Cosine_distance(embedding, '[1, 0, 0, 1, 1, 2, 0, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 1, 0, 0, 0, 0]') <0.2
  ORDER by Vec_Cosine_distance(embedding, '[1, 0, 0, 1, 1, 2, 0, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 1, 0, 0, 0, 0]')
LIMIT 8;

SELECT * FROM INFORMATION_SCHEMA.TIFLASH_INDEXES;

EXPLAIN 
SELECT FullName,Vec_Cosine_distance(embedding, '[1, 0, 0, 1, 1, 2, 0, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 1, 0, 0, 0, 0]') 
  FROM FuzzyNameSearch
/*where Vec_Cosine_distance(embedding, '[1, 0, 0, 1, 1, 2, 0, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 1, 0, 0, 0, 0]') <0.2*/
  ORDER by Vec_Cosine_distance(embedding, '[1, 0, 0, 1, 1, 2, 0, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 1, 0, 0, 0, 0]')
LIMIT 8;