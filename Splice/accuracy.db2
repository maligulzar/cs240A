connect to sample;

drop table accuracy;

CREATE TABLE accuracy(class varchar(3), accuracy double);

INSERT INTO accuracy VALUES ('n' , cast((select count(*) from result where actual=predicted) as double) / cast((select count(*) from result) as double));
INSERT INTO accuracy VALUES ('r' , cast((select count(*) from resultr where actual=predicted) as double) / cast((select count(*) from resultr) as double));


terminate;