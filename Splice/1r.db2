connect to sample;
drop table rclass;
create table rclass( type Integer, dataval varchar(1), class varchar(1));


	insert into rclass(type, class, dataval)
	WITH grouped(type, class, dataval, sum_weight) AS (SELECT type,class,dataval,SUM(known) FROM splicetrainset GROUP BY GROUPING SETS( (type, dataval),(type, class, dataval) )),
	
	errortable(type, class, dataval, error, total) AS		
		(SELECT t.type, t.class, t.dataval,
			CAST(t.sum_weight AS double)
				,
			CAST(t2.sum_weight AS double)
		FROM grouped AS t, grouped AS t2
		WHERE t.type = t2.type
		AND t2.class IS NULL
		AND t.class IS NOT NULL
		AND t.dataval = t2.dataval
	),
	
	errortotal(type, dataval, error) AS	
	(select type, dataval, Min(error) from errortable group by GROUPING SETS((type, dataval))),
	
	errortypetotal(type, dataval, error,class,  total) AS (select e1.type, e1.dataval , e1.error, e2.class, e2.total from errortotal e1, errortable e2 where e1.type=e2.type and e1.dataval=e2.dataval and e2.error=e1.error),
	
	errorfinal(type, error) AS
	(select type, Min(error)/SUM(total)  from errortypetotal group by type),

	subresult(type, class, dataval, error, total) AS (select * from errortable where dataval!='?' and type=(select type from errorfinal where error = (select Min(error) from errorfinal)    fetch first 1 rows only )   )
(select s.type, s.class, s.dataval from subresult s, (select dataval, max(error) as error from subresult group by dataval ) as temp where temp.error=s.error and temp.dataval=s.dataval);




terminate;
