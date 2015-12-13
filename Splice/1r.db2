CONNECT TO sample; 

DROP TABLE rclass; 

CREATE TABLE rclass 
  ( 
     TYPE INTEGER,dataval VARCHAR(1),class VARCHAR(1) 
  ); 

INSERT INTO rclass 
            (TYPE,class,dataval) 
WITH grouped(type, class, dataval, sum_weight) 
     AS (SELECT TYPE,class,dataval,Sum(known) 
         FROM   splicetrainset 
         GROUP  BY grouping sets( ( TYPE, dataval ), ( TYPE, class, dataval ) )) 
, 
     errortable(type, class, dataval, error, total) 
     AS (SELECT t.TYPE,t.class,t.dataval,CAST(t.sum_weight AS DOUBLE),CAST( 
                   t2.sum_weight AS DOUBLE) 
         FROM   grouped AS t,grouped AS t2 
         WHERE  t.TYPE = t2.TYPE 
                AND t2.class IS NULL 
                AND t.class IS NOT NULL 
                AND t.dataval = t2.dataval), 
     errortotal(type, dataval, error) 
     AS (SELECT TYPE,dataval,Min(error) 
         FROM   errortable 
         GROUP  BY grouping sets(( TYPE, dataval ))), 
     errortypetotal(type, dataval, error, class, total) 
     AS (SELECT e1.TYPE,e1.dataval,e1.error,e2.class,e2.total 
         FROM   errortotal e1,errortable e2 
         WHERE  e1.TYPE = e2.TYPE 
                AND e1.dataval = e2.dataval 
                AND e2.error = e1.error), 
     errorfinal(type, error) 
     AS (SELECT TYPE,Min(error) / Sum(total) 
         FROM   errortypetotal 
         GROUP  BY TYPE), 
     subresult(type, class, dataval, error, total) 
     AS (SELECT * 
         FROM   errortable 
         WHERE  dataval != '?' 
                AND TYPE = (SELECT TYPE 
                            FROM   errorfinal 
                            WHERE  error = (SELECT Min(error) 
                                            FROM   errorfinal) 
                            FETCH first 1 ROWS only)) 
(SELECT s.TYPE,s.class,s.dataval 
FROM   subresult s,(SELECT dataval,Max(error) AS error 
FROM   subresult 
GROUP  BY dataval) AS temp 
WHERE  temp.error = s.error 
AND temp.dataval = s.dataval); 

terminate; 