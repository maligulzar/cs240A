CONNECT TO sample; 

DROP TABLE RESULT; 

CREATE TABLE RESULT 
  ( 
     ROW INTEGER,actual VARCHAR(1),predicted VARCHAR(1) 
  ); 

INSERT INTO RESULT 
            (ROW,actual,predicted) 
WITH probs(id, predicted, prob) 
     AS (SELECT t.id,n.class,n.prob 
         FROM   mushroomstestset AS t,nbc AS n 
         WHERE  t.TYPE = n.TYPE 
                AND t.dataval = n. dataval 
                AND t.known > 0), 
     sumprobs(id, predicted, sp) 
     AS (SELECT id,predicted,Sum(Log(prob)) 
         FROM   probs 
         GROUP  BY id,predicted), 
     wprobs(wid, wpredicted, wprob) 
     AS (SELECT s.id,s.predicted,s.sp + Log(nc.prob) 
         FROM   sumprobs AS s,classprob AS nc 
         WHERE  s.predicted = nc.class), 
     findmax(maxid, prob) 
     AS (SELECT wid,Max(wprob) 
         FROM   wprobs 
         GROUP  BY wid) 
(SELECT t.id,t.class,w.wpredicted 
FROM   mushroomstestset AS t,findmax AS m,wprobs AS w 
WHERE  t.TYPE = 1 
AND t.id = m.maxid 
AND t.id = w.wid 
AND m.prob = w.wprob); 

terminate; 