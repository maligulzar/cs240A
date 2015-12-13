CONNECT TO sample; 

DROP TABLE classprob; 

CREATE TABLE classprob 
  ( 
     class VARCHAR(1),prob DOUBLE 
  ); 

INSERT INTO classprob 
(SELECT class,CAST(val AS DOUBLE) / CAST((SELECT Sum(known) 
                                          FROM   mushroomstrainset 
                                          WHERE  TYPE = 1) AS DOUBLE) 
 FROM   (SELECT class,Sum(known) AS val 
         FROM   mushroomstrainset 
         WHERE  TYPE = 1 
         GROUP  BY class)); 

terminate; 