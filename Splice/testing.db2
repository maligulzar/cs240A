------ BOOSTING ------
-- This script implements boosting. 
-- Some of the SQL here is a bit ugly because it deals with procedures, but
-- all of this functionality could be emulated by the other .sql files.
-- This file just makes boosting as simple as one call to a stored function
-- (boost_until_fixpoint).
--
-- This script should be run after test.sql



---- INITIALIZATION ----

CONNECT TO sample;

-- drop the procedures we're about to create, in case they already exist
DROP PROCEDURE update_train;
DROP PROCEDURE update_NBC;
DROP PROCEDURE update_results;
DROP PROCEDURE boost_once;
DROP PROCEDURE boost_to_fixpoint;



---- PROCEDURES ----

--- update_train(iteration): updates the weights of data in trainset
-- This procedure is essentially the same as the insertion into
-- test_results in test.sql. The only difference is that we make sure to
-- only count results from the last iteration. At the end of the function,
-- we multiply the weight of all matched correctly classified results by
-- two. This strategy emulates duplicating the records. (1 record becomes
-- 2, which then become 4, and so forth.) I also experimented with
-- incrementing the weight by one, but that strategy resulted in smaller
-- gains, so I chose this one.
-- Also: we create a temporary table (temp_boost) because, to my knowledge,
-- there is no way to use WITH statements when updating.
---
CREATE PROCEDURE update_train(iteration INTEGER)
BEGIN
	CREATE TABLE temp_boost(datarow INTEGER);INSERT INTO temp_boost
	WITH
		RelevantProbs(datarow, predicted, prob) AS 
			(SELECT ts.datarow, n.class, n.probability
				FROM trainset AS ts, NBC AS n
				WHERE ts.datacol = n.datacol
				AND ts.value = n.dataval
				AND ts.weight > 0
				AND n.run_num = iteration - 1),
		SumProbs(sumdatarow, sumpredicted, sumprob) AS
			(SELECT datarow, predicted, SUM(LOG(prob)) FROM RelevantProbs
				GROUP BY datarow, predicted),
		WeightedProbs(wdatarow, wpredicted, wprob) AS
			(SELECT sp.sumdatarow, sp.sumpredicted, sp.sumprob+LOG(nc.probability)
				FROM SumProbs AS sp, NBC_class AS nc
				WHERE sp.sumpredicted = nc.class
				AND nc.run_num = iteration-1),
		MaxProbs(maxdatarow, maxprob) AS
			(SELECT wdatarow, MAX(wprob) FROM WeightedProbs GROUP BY wdatarow)
		(SELECT ts.datarow
			FROM trainset AS ts, MaxProbs AS mp, WeightedProbs AS wp
			WHERE ts.datarow = mp.maxdatarow
			AND ts.datarow = wp.wdatarow
			AND mp.maxprob = wp.wprob
			AND ts.datacol = 1
			AND ts.class <> wp.wpredicted);UPDATE trainset SET weight = weight * 2 WHERE weight > 0 AND
		datarow NOT IN (SELECT datarow FROM temp_boost);DROP TABLE temp_boost;END;

--- update_NBC(iteration): inserts the next iteration into the NBC and
--    NBC_class tables
-- This procedure is essentially the same as the insertions into NBC and
-- NBC_class in nbc.sql. The only difference is that we insert into the
-- current iteration, rather than relying on the default iteration in the
-- NBC and NBC_class tables (which is 1).
---
CREATE PROCEDURE update_NBC(iteration INTEGER)
BEGIN
	INSERT INTO NBC(run_num, datacol, dataval, class, probability)
		WITH GroupedData(datacol, class, value, sum_weight) AS
			(SELECT datacol, class, value, SUM(weight)
				FROM trainset
				GROUP BY GROUPING SETS( (datacol, class), (datacol, class, value)))
		(SELECT iteration, gd1.datacol, gd1.value, gd1.class,
				CAST(gd1.sum_weight AS DECIMAL(10,0))
						/
				CAST(gd2.sum_weight AS DECIMAL(10,0))
			FROM GroupedData AS gd1, GroupedData AS gd2
			WHERE gd1.datacol = gd2.datacol
			AND gd1.class = gd2.class
			AND gd1.value IS NOT NULL
		AND gd2.value IS NULL);	INSERT INTO NBC_class(run_num, class, probability)
		WITH
			TotalCount(value) AS
				(SELECT SUM(weight) FROM trainset WHERE datacol = 1),
			ClassCount(class, value) AS
				(SELECT class, SUM(weight) FROM trainset
					WHERE datacol = 1 GROUP BY class)
		(SELECT iteration, cc.class,
			CAST(cc.value AS DECIMAL(10,0)) / CAST(tc.value AS DECIMAL(10,0))
			FROM TotalCount AS tc, ClassCount AS cc);END;

--- update_results(iteration): inserts the next iteration into the
--    test_results and test_results_agg tables
-- This procedure is essentially the same as the insertions into
-- test_results and test_results_agg in test.sql. The only differences are
-- that we use data in the current iteration of NBC and NBC_class, and when
-- inserting, we also insert the current iteration, instead of relying on
-- the default (which is 1).
---
CREATE PROCEDURE update_results(iteration INTEGER)
BEGIN
	INSERT INTO test_results(run_num, datarow, actual, predicted)
		WITH
			RelevantProbs(datarow, predicted, prob) AS 
				(SELECT ts.datarow, n.class, n.probability
					FROM testset AS ts, NBC AS n
					WHERE ts.datacol = n.datacol
					AND ts.value = n.dataval
					AND ts.weight > 0
					AND n.run_num = iteration),
			SumProbs(sumdatarow, sumpredicted, sumprob) AS
				(SELECT datarow, predicted, SUM(LOG(prob)) FROM RelevantProbs
					GROUP BY datarow, predicted),
			WeightedProbs(wdatarow, wpredicted, wprob) AS
				(SELECT sp.sumdatarow, sp.sumpredicted, sp.sumprob+LOG(nc.probability)
					FROM SumProbs AS sp, NBC_class AS nc
					WHERE sp.sumpredicted = nc.class
					AND nc.run_num = iteration),
			MaxProbs(maxdatarow, maxprob) AS
				(SELECT wdatarow, MAX(wprob) FROM WeightedProbs GROUP BY wdatarow)
		(SELECT iteration, ts.datarow, ts.class, wp.wpredicted
			FROM testset AS ts, MaxProbs AS mp, WeightedProbs AS wp
			WHERE ts.datarow = mp.maxdatarow
			AND ts.datarow = wp.wdatarow
			AND mp.maxprob = wp.wprob
			AND ts.datacol = 1);	INSERT INTO test_results_agg(run_num, succ_rate)
		WITH
			success(num) AS
				(SELECT COUNT(predicted) FROM test_results
					WHERE predicted = actual AND run_num = iteration),
			total(num) AS
				(SELECT COUNT(predicted) FROM test_results
					WHERE run_num = iteration)
			(SELECT iteration,				CAST(s.num AS DECIMAL(10,0))/CAST(t.num AS DECIMAL(10,0))
			FROM success AS s, total AS t);END;

--- boost_once(iteration): run boost functions for this iteration
-- This procedure just calls the three above. It first updates the weights
-- of the training data, then creates a new iteration of NBC and NBC_class
-- that takes these new weights into account, and finally creates a new
-- iteration of test_results and test_results_agg that calculate testset
-- results based on the new NBC and NBC_class.
---
CREATE PROCEDURE boost_once(iteration INTEGER)
BEGIN	CALL update_train(iteration);	CALL update_NBC(iteration);	CALL update_results(iteration);END;

--- boost_to_fixpoint(): boosts until boosting won't help
-- This procedure runs boost_once incrementally, until the latest result
-- (in test_results_agg) is no better than the previous result. It stores
-- the previous result in last_time, and the current result in this_time,
-- then increments iteration and calls boost_once until the results are
-- not better.
---
CREATE PROCEDURE boost_to_fixpoint()
BEGIN
	DECLARE last_time DECIMAL(11,10) DEFAULT 0;DECLARE this_time DECIMAL(11,10);	DECLARE iteration INTEGER DEFAULT 1;	SELECT succ_rate INTO this_time FROM test_results_agg WHERE run_num = iteration; WHILE (this_time > last_time) DO		SET iteration = iteration + 1;		CALL boost_once(iteration);		SET last_time = this_time;		SELECT succ_rate INTO this_time FROM test_results_agg WHERE run_num = iteration;END WHILE;END;





---- QUERIES ----

-- All we do is call boost_to_fixpoint, and it will update the database
-- until the results won't get better!
-- CALL boost_to_fixpoint();





---- CLEAN UP ----

CONNECT RESET;
TERMINATE;

