CONNECT TO sample; 

DROP TABLE accuracy; 

CREATE TABLE accuracy 
  ( 
     class VARCHAR(3),accuracy DOUBLE 
  ); 

INSERT INTO accuracy 
VALUES      ('n',CAST((SELECT COUNT(*) 
                       FROM   RESULT 
                       WHERE  actual = predicted) AS DOUBLE) / 
                              CAST((SELECT COUNT(*) 
                                    FROM   RESULT) AS DOUBLE)); 

INSERT INTO accuracy 
VALUES      ('r',CAST((SELECT COUNT(*) 
                       FROM   resultr 
                       WHERE  actual = predicted) AS DOUBLE) / CAST( 
                              (SELECT COUNT(*) 
                               FROM   resultr) AS DOUBLE)); 

terminate; 