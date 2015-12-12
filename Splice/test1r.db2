connect to sample;

drop table resultr;

CREATE TABLE resultr(row INTEGER, actual VARCHAR(1), predicted VARCHAR(1));

INSERT INTO resultr(row, actual, predicted)
	(SELECT t.id, t.class, r.class
		FROM splicetestset AS t, rclass AS r
		WHERE t.type = r.type AND t.dataval = r.dataval
		AND t.dataval!= '?');
 
 terminate;