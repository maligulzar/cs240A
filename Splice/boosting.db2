connect to sample;
drop table tempresult;
drop table boost;
drop table nbcboost;
drop table boostclassprob;
drop table testresult;
drop table accuracytrend;

CREATE TABLE accuracytrend(run integer, accuracy double);
CREATE TABLE testresult(row INTEGER, actual VARCHAR(1), predicted VARCHAR(1));
create table boostclassprob(class varchar(1) , prob double);
create table boost(id INTEGER, type INTEGER, dataval varchar(1), class varchar(1), known INTEGER);
CREATE TABLE tempresult(row INTEGER, actual VARCHAR(1), predicted VARCHAR(1));
create table nbcboost(type Integer, dataval varchar(1), class varchar(1) , prob double );



insert into boost (select  * from splicetrainset);
insert into nbcboost (select type , dataval , class  , prob   from nbc);
insert into boostclassprob (select class  , prob  from classprob);

BEGIN Atomic DECLARE prev double DEFAULT 0;DECLARE curr double; DECLARE run double default 1;SELECT 'afteratmoic' FROM SYSIBM.SYSDUMMY1; set curr= cast((

select count(*) from result where actual=predicted) as double) /

cast((select count(*) from result) as double); WHILE curr > prev OR run<6 DO set prev=curr;INSERT into accuracytrend VALUES(

run , prev);	select curr,run,accuracy from accuracytrend; delete from tempresult; INSERT INTO  tempresult (row, actual, predicted)
	WITH
		probs(id, predicted, prob) AS 
			(SELECT t.id, n.class, n.prob FROM boost AS t, nbcboost AS n WHERE t.type = n.type AND t.dataval = n. dataval AND t.known > 0),
		SumProbs(id, predicted, sp) AS
			(SELECT id, predicted, SUM(LOG(prob)) FROM probs
				GROUP BY id, predicted),
		WProbs(wid, wpredicted, wprob) AS
			(SELECT s.id, s.predicted, s.sp+LOG(nc.prob)
				FROM SumProbs AS s, boostclassprob AS nc 
				WHERE s.predicted = nc.class),
		findmax(maxid, prob) AS
			(SELECT wid, MAX(wprob) FROM WProbs GROUP BY wid)
	(SELECT t.id, t.class, w.wpredicted
		FROM boost AS t, findmax AS m, WProbs AS w
		WHERE t.type = 1 AND t.id = m.maxid
		AND t.id = w.wid
		AND m.prob = w.wprob); update boost set known=known*2 where id in (select row from tempresult where actual!=predicted);delete from nbcboost;delete from boostclassprob;INSERT INTO nbcboost
	WITH temp(type, class, dataval, sum_weight) AS
		(SELECT type, class, dataval, SUM(known) FROM boost GROUP BY GROUPING SETS( (type, class), (type, class, dataval)))(SELECT t.type, t.dataval, t.class,
			CAST(t.sum_weight AS double)
					/
			CAST(t2.sum_weight AS double)
		FROM temp AS t, temp AS t2
		WHERE t.type = t2.type
		AND t2.dataval IS NULL
		AND t.dataval IS NOT NULL
		AND t.class = t2.class);INSERT INTO boostclassprob
	(SELECT class, CAST( val AS double) / CAST((SELECT SUM(known) FROM boost WHERE type = 1 ) AS double) FROM (SELECT class, SUM(known) as val FROM boost WHERE type = 1 GROUP BY class));INSERT into accuracytrend VALUES(

run , prev); INSERT INTO testresult( row, actual, predicted)
	WITH
		probs(id, predicted, prob) AS 
			(SELECT t.id, n.class, n.prob FROM splicetestset AS t, nbcboost AS n WHERE t.type = n.type AND t.dataval = n. dataval AND t.known > 0 ),
		SumProbs(id, predicted, sp) AS
			(SELECT id, predicted, SUM(LOG(prob)) FROM probs
				GROUP BY id, predicted),
		WProbs(wid, wpredicted, wprob) AS
			(SELECT s.id, s.predicted, s.sp+LOG(nc.prob)
				FROM SumProbs AS s, boostclassprob AS nc 
				WHERE s.predicted = nc.class),
		findmax(maxid, prob) AS
			(SELECT wid, MAX(wprob) FROM WProbs GROUP BY wid)
	(SELECT t.id, t.class, w.wpredicted
		FROM splicetestset AS t, findmax AS m, WProbs AS w
		WHERE t.type = 1 AND t.id = m.maxid
		AND t.id = w.wid
		AND m.prob = w.wprob); INSERT into accuracytrend VALUES(

run , prev);set curr= cast((

select count(*) from testresult t where t.actual=t.predicted) as double) 

/ 

cast((select count(*) from testresult) as double);	  set run=run+1; INSERT into accuracytrend VALUES(

run , curr);select curr,run,accuracy from accuracytrend; delete from tempresult;delete from testresult ;   END WHILE;END;

terminate;