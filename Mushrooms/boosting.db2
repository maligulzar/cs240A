CONNECT TO sample; 

DROP TABLE tempresult; 

DROP TABLE boost; 

DROP TABLE nbcboost; 

DROP TABLE boostclassprob; 

DROP TABLE testresult; 

DROP TABLE accuracytrend; 

CREATE TABLE accuracytrend 
  ( 
     RUN INTEGER,accuracy DOUBLE 
  ); 

CREATE TABLE testresult 
  ( 
     ROW INTEGER,actual VARCHAR(1),predicted VARCHAR(1) 
  ); 

CREATE TABLE boostclassprob 
  ( 
     class VARCHAR(1),prob DOUBLE 
  ); 

CREATE TABLE boost 
  ( 
     id INTEGER,TYPE INTEGER,dataval VARCHAR(1),class VARCHAR(1),known INTEGER 
  ); 

CREATE TABLE tempresult 
  ( 
     ROW INTEGER,actual VARCHAR(1),predicted VARCHAR(1) 
  ); 

CREATE TABLE nbcboost 
  ( 
     TYPE INTEGER,dataval VARCHAR(1),class VARCHAR(1),prob DOUBLE 
  ); 

INSERT INTO boost 
(SELECT * 
 FROM   mushroomstrainset); 

INSERT INTO nbcboost 
(SELECT TYPE,dataval,class,prob 
 FROM   nbc); 

INSERT INTO boostclassprob 
(SELECT class,prob 
 FROM   classprob); 

BEGIN atomic 
  DECLARE prev DOUBLE DEFAULT 0; 

  DECLARE curr DOUBLE; 

  DECLARE RUN DOUBLE DEFAULT 1; 

  SELECT 'afteratmoic' 
  FROM   SYSIBM.sysdummy1; 

  SET curr= CAST(( SELECT COUNT(*) FROM RESULT WHERE actual=predicted) AS DOUBLE 
  ) 
  / CAST((SELECT COUNT(*) FROM RESULT) AS DOUBLE); 

  WHILE curr > prev 
         OR RUN < 6 DO 
    SET prev=curr; 

    INSERT INTO accuracytrend 
    VALUES     ( RUN,prev); 

    SELECT curr,RUN,accuracy 
    FROM   accuracytrend; 

    DELETE FROM tempresult; 

    INSERT INTO tempresult 
                (ROW,actual,predicted) 
    WITH probs(id, predicted, prob) 
         AS (SELECT t.id,n.class,n.prob 
             FROM   boost AS t,nbcboost AS n 
             WHERE  t.TYPE = n.TYPE 
                    AND t.dataval = n. dataval 
                    AND t.known > 0), 
         sumprobs(id, predicted, sp) 
         AS (SELECT id,predicted,Sum(Log(prob)) 
             FROM   probs 
             GROUP  BY id,predicted), 
         wprobs(wid, wpredicted, wprob) 
         AS (SELECT s.id,s.predicted,s.sp + Log(nc.prob) 
             FROM   sumprobs AS s,boostclassprob AS nc 
             WHERE  s.predicted = nc.class), 
         findmax(maxid, prob) 
         AS (SELECT wid,Max(wprob) 
             FROM   wprobs 
             GROUP  BY wid) 
    (SELECT t.id,t.class,w.wpredicted 
    FROM   boost AS t,findmax AS m,wprobs AS w 
    WHERE  t.TYPE = 1 
    AND t.id = m.maxid 
    AND t.id = w.wid 
    AND m.prob = w.wprob); 

    UPDATE boost 
    SET    known = known * 2 
    WHERE  id IN (SELECT ROW 
                  FROM   tempresult 
                  WHERE  actual != predicted); 

    DELETE FROM nbcboost; 

    DELETE FROM boostclassprob; 

    INSERT INTO nbcboost 
    WITH temp(type, class, dataval, sum_weight) 
         AS (SELECT TYPE,class,dataval,Sum(known) 
             FROM   boost 
             GROUP  BY grouping sets( ( TYPE, class ), ( TYPE, class, dataval ) 
            )) 
    (SELECT t.TYPE,t.dataval,t.class,CAST(t.sum_weight AS DOUBLE) / CAST( 
                                     t2.sum_weight AS DOUBLE) 
    FROM   temp AS t,temp AS t2 
    WHERE  t.TYPE = t2.TYPE 
    AND t2.dataval IS NULL 
    AND t.dataval IS NOT NULL 
    AND t.class = t2.class); 

    INSERT INTO boostclassprob 
    (SELECT class,CAST(val AS DOUBLE) / CAST((SELECT Sum(known) 
                                              FROM   boost 
                                              WHERE  TYPE = 1) AS DOUBLE) 
     FROM   (SELECT class,Sum(known) AS val 
             FROM   boost 
             WHERE  TYPE = 1 
             GROUP  BY class)); 

    INSERT INTO accuracytrend 
    VALUES     ( RUN,prev); 

    INSERT INTO testresult 
                (ROW,actual,predicted) 
    WITH probs(id, predicted, prob) 
         AS (SELECT t.id,n.class,n.prob 
             FROM   mushroomstestset AS t,nbcboost AS n 
             WHERE  t.TYPE = n.TYPE 
                    AND t.dataval = n. dataval 
                    AND t.known > 0), 
         sumprobs(id, predicted, sp) 
         AS (SELECT id,predicted,Sum(Log(prob)) 
             FROM   probs 
             GROUP  BY id,predicted), 
         wprobs(wid, wpredicted, wprob) 
         AS (SELECT s.id,s.predicted,s.sp + Log(nc.prob) 
             FROM   sumprobs AS s,boostclassprob AS nc 
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

    INSERT INTO accuracytrend 
    VALUES     ( RUN,prev); 

    SET curr= CAST(( SELECT COUNT(*) FROM testresult t WHERE 
    t.actual=t.predicted) 
    AS DOUBLE) / CAST((SELECT COUNT(*) FROM testresult) AS DOUBLE); 

    SET RUN=RUN+1; 

    INSERT INTO accuracytrend 
    VALUES     ( RUN,curr); 

    SELECT curr,RUN,accuracy 
    FROM   accuracytrend; 

    DELETE FROM tempresult; 

    DELETE FROM testresult; 
  END WHILE; 
END; 

terminate; 