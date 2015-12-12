connect to sample;
drop table nbc;
create table nbc( type Integer, dataval varchar(1), class varchar(1) , prob double );



INSERT INTO NBC
	WITH temp(type, class, dataval, sum_weight) AS
		(SELECT type, class, dataval, SUM(known) FROM splicetrainset GROUP BY GROUPING SETS( (type, class), (type, class, dataval)))(SELECT t.type, t.dataval, t.class,
			CAST(t.sum_weight AS double)
					/
			CAST(t2.sum_weight AS double)
		FROM temp AS t, temp AS t2
		WHERE t.type = t2.type
		AND t2.dataval IS NULL
		AND t.dataval IS NOT NULL
		AND t.class = t2.class
	);

	terminate;