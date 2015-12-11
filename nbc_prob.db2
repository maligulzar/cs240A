connect to sample;


drop table classprob;

create table classprob(class varchar(1) , prob double);

INSERT INTO classprob
	(SELECT class, CAST( val AS double) / CAST((SELECT SUM(known) FROM mushroomstrainset WHERE type = 1) AS double) FROM (SELECT class, SUM(known) as val FROM mushroomstrainset WHERE type = 1 GROUP BY class));
	
terminate;