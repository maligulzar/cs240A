connect to sample;

drop table result;

CREATE TABLE result(row INTEGER, actual VARCHAR(1), predicted VARCHAR(1));

INSERT INTO result(row, actual, predicted)
	WITH
		probs(id, predicted, prob) AS 
			(SELECT t.id, n.class, n.prob FROM mushroomstestset AS t, nbc AS n WHERE t.type = n.type AND t.dataval = n. dataval AND t.known > 0),
		SumProbs(id, predicted, sp) AS
			(SELECT id, predicted, SUM(LOG(prob)) FROM probs
				GROUP BY id, predicted),
		WProbs(wid, wpredicted, wprob) AS
			(SELECT s.id, s.predicted, s.sp+LOG(nc.prob)
				FROM SumProbs AS s, classprob AS nc 
				WHERE s.predicted = nc.class),
		findmax(maxid, prob) AS
			(SELECT wid, MAX(wprob) FROM WProbs GROUP BY wid)
	(SELECT t.id, t.class, w.wpredicted
		FROM mushroomstestset AS t, findmax AS m, WProbs AS w
		WHERE t.type = 1 AND t.id = m.maxid
		AND t.id = w.wid
		AND m.prob = w.wprob
		);
 
 terminate;
