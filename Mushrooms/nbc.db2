CONNECT TO sample; 

DROP TABLE nbc; 

CREATE TABLE nbc 
  ( 
     TYPE INTEGER,dataval VARCHAR(1),class VARCHAR(1),prob DOUBLE 
  ); 

INSERT INTO nbc 
WITH temp(type, class, dataval, sum_weight) 
     AS (SELECT TYPE,class,dataval,Sum(known) 
         FROM   mushroomstrainset 
         GROUP  BY grouping sets( ( TYPE, class ), ( TYPE, class, dataval ) )) 
(SELECT t.TYPE,t.dataval,t.class,CAST(t.sum_weight AS DOUBLE) / CAST( 
                                 t2.sum_weight AS DOUBLE) 
FROM   temp AS t,temp AS t2 
WHERE  t.TYPE = t2.TYPE 
AND t2.dataval IS NULL 
AND t.dataval IS NOT NULL 
AND t.class = t2.class); 

terminate; 