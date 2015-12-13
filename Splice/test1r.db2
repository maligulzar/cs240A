CONNECT TO sample; 

DROP TABLE resultr; 

CREATE TABLE resultr 
  ( 
     ROW INTEGER,actual VARCHAR(1),predicted VARCHAR(1) 
  ); 

INSERT INTO resultr 
            (ROW,actual,predicted) 
(SELECT t.id,t.class,r.class 
 FROM   splicetestset AS t,rclass AS r 
 WHERE  t.TYPE = r.TYPE 
        AND t.dataval = r.dataval 
        AND t.dataval != '?'); 

terminate; 