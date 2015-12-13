CONNECT TO sample; 

DROP TABLE splicetestset; 

DROP TABLE splicetrainset; 

CREATE TABLE splicetestset 
  ( 
     id INTEGER,TYPE INTEGER,dataval VARCHAR(1),class VARCHAR(1),known INTEGER 
  ); 

CREATE TABLE splicetrainset 
  ( 
     id INTEGER,TYPE INTEGER,dataval VARCHAR(1),class VARCHAR(1),known INTEGER 
  ); 

INSERT INTO splicetestset 
(SELECT id,1,pn30,class,1 
 FROM   splicetest); 

INSERT INTO splicetestset 
(SELECT id,2,pn29,class,1 
 FROM   splicetest); 

INSERT INTO splicetestset 
(SELECT id,3,pn28,class,1 
 FROM   splicetest); 

INSERT INTO splicetestset 
(SELECT id,4,pn27,class,1 
 FROM   splicetest); 

INSERT INTO splicetestset 
(SELECT id,5,pn26,class,1 
 FROM   splicetest); 

INSERT INTO splicetestset 
(SELECT id,6,pn25,class,1 
 FROM   splicetest); 

INSERT INTO splicetestset 
(SELECT id,7,pn24,class,1 
 FROM   splicetest); 

INSERT INTO splicetestset 
(SELECT id,8,pn23,class,1 
 FROM   splicetest); 

INSERT INTO splicetestset 
(SELECT id,9,pn22,class,1 
 FROM   splicetest); 

INSERT INTO splicetestset 
(SELECT id,10,pn21,class,1 
 FROM   splicetest); 

INSERT INTO splicetestset 
(SELECT id,11,pn20,class,1 
 FROM   splicetest); 

INSERT INTO splicetestset 
(SELECT id,12,pn19,class,1 
 FROM   splicetest); 

INSERT INTO splicetestset 
(SELECT id,13,pn18,class,1 
 FROM   splicetest); 

INSERT INTO splicetestset 
(SELECT id,14,pn17,class,1 
 FROM   splicetest); 

INSERT INTO splicetestset 
(SELECT id,15,pn16,class,1 
 FROM   splicetest); 

INSERT INTO splicetestset 
(SELECT id,16,pn15,class,1 
 FROM   splicetest); 

INSERT INTO splicetestset 
(SELECT id,17,pn14,class,1 
 FROM   splicetest); 

INSERT INTO splicetestset 
(SELECT id,18,pn13,class,1 
 FROM   splicetest); 

INSERT INTO splicetestset 
(SELECT id,19,pn12,class,1 
 FROM   splicetest); 

INSERT INTO splicetestset 
(SELECT id,20,pn11,class,1 
 FROM   splicetest); 

INSERT INTO splicetestset 
(SELECT id,21,pn10,class,1 
 FROM   splicetest); 

INSERT INTO splicetestset 
(SELECT id,22,pn9,class,1 
 FROM   splicetest); 

INSERT INTO splicetestset 
(SELECT id,23,pn8,class,1 
 FROM   splicetest); 

INSERT INTO splicetestset 
(SELECT id,24,pn7,class,1 
 FROM   splicetest); 

INSERT INTO splicetestset 
(SELECT id,25,pn5,class,1 
 FROM   splicetest); 

INSERT INTO splicetestset 
(SELECT id,26,pn4,class,1 
 FROM   splicetest); 

INSERT INTO splicetestset 
(SELECT id,27,pn3,class,1 
 FROM   splicetest); 

INSERT INTO splicetestset 
(SELECT id,28,pn2,class,1 
 FROM   splicetest); 

INSERT INTO splicetestset 
(SELECT id,29,pn1,class,1 
 FROM   splicetest); 

INSERT INTO splicetestset 
(SELECT id,30,p1,class,1 
 FROM   splicetest); 

INSERT INTO splicetestset 
(SELECT id,31,p2,class,1 
 FROM   splicetest); 

INSERT INTO splicetestset 
(SELECT id,32,p3,class,1 
 FROM   splicetest); 

INSERT INTO splicetestset 
(SELECT id,33,p4,class,1 
 FROM   splicetest); 

INSERT INTO splicetestset 
(SELECT id,34,p5,class,1 
 FROM   splicetest); 

INSERT INTO splicetestset 
(SELECT id,35,p6,class,1 
 FROM   splicetest); 

INSERT INTO splicetestset 
(SELECT id,36,p7,class,1 
 FROM   splicetest); 

INSERT INTO splicetestset 
(SELECT id,37,p8,class,1 
 FROM   splicetest); 

INSERT INTO splicetestset 
(SELECT id,38,p9,class,1 
 FROM   splicetest); 

INSERT INTO splicetestset 
(SELECT id,39,p10,class,1 
 FROM   splicetest); 

INSERT INTO splicetestset 
(SELECT id,40,p11,class,1 
 FROM   splicetest); 

INSERT INTO splicetestset 
(SELECT id,41,p12,class,1 
 FROM   splicetest); 

INSERT INTO splicetestset 
(SELECT id,42,p13,class,1 
 FROM   splicetest); 

INSERT INTO splicetestset 
(SELECT id,43,p14,class,1 
 FROM   splicetest); 

INSERT INTO splicetestset 
(SELECT id,44,p15,class,1 
 FROM   splicetest); 

INSERT INTO splicetestset 
(SELECT id,45,p16,class,1 
 FROM   splicetest); 

INSERT INTO splicetestset 
(SELECT id,46,p17,class,1 
 FROM   splicetest); 

INSERT INTO splicetestset 
(SELECT id,47,p18,class,1 
 FROM   splicetest); 

INSERT INTO splicetestset 
(SELECT id,48,p19,class,1 
 FROM   splicetest); 

INSERT INTO splicetestset 
(SELECT id,49,p20,class,1 
 FROM   splicetest); 

INSERT INTO splicetestset 
(SELECT id,50,p21,class,1 
 FROM   splicetest); 

INSERT INTO splicetestset 
(SELECT id,51,p22,class,1 
 FROM   splicetest); 

INSERT INTO splicetestset 
(SELECT id,52,p23,class,1 
 FROM   splicetest); 

INSERT INTO splicetestset 
(SELECT id,53,p24,class,1 
 FROM   splicetest); 

INSERT INTO splicetestset 
(SELECT id,54,p25,class,1 
 FROM   splicetest); 

INSERT INTO splicetestset 
(SELECT id,55,p26,class,1 
 FROM   splicetest); 

INSERT INTO splicetestset 
(SELECT id,56,p27,class,1 
 FROM   splicetest); 

INSERT INTO splicetestset 
(SELECT id,57,p28,class,1 
 FROM   splicetest); 

INSERT INTO splicetestset 
(SELECT id,58,p29,class,1 
 FROM   splicetest); 

INSERT INTO splicetestset 
(SELECT id,59,p30,class,1 
 FROM   splicetest); 

INSERT INTO splicetrainset 
(SELECT id,1,pn30,class,1 
 FROM   splicetrain); 

INSERT INTO splicetrainset 
(SELECT id,2,pn29,class,1 
 FROM   splicetrain); 

INSERT INTO splicetrainset 
(SELECT id,3,pn28,class,1 
 FROM   splicetrain); 

INSERT INTO splicetrainset 
(SELECT id,4,pn27,class,1 
 FROM   splicetrain); 

INSERT INTO splicetrainset 
(SELECT id,5,pn26,class,1 
 FROM   splicetrain); 

INSERT INTO splicetrainset 
(SELECT id,6,pn25,class,1 
 FROM   splicetrain); 

INSERT INTO splicetrainset 
(SELECT id,7,pn24,class,1 
 FROM   splicetrain); 

INSERT INTO splicetrainset 
(SELECT id,8,pn23,class,1 
 FROM   splicetrain); 

INSERT INTO splicetrainset 
(SELECT id,9,pn22,class,1 
 FROM   splicetrain); 

INSERT INTO splicetrainset 
(SELECT id,10,pn21,class,1 
 FROM   splicetrain); 

INSERT INTO splicetrainset 
(SELECT id,11,pn20,class,1 
 FROM   splicetrain); 

INSERT INTO splicetrainset 
(SELECT id,12,pn19,class,1 
 FROM   splicetrain); 

INSERT INTO splicetrainset 
(SELECT id,13,pn18,class,1 
 FROM   splicetrain); 

INSERT INTO splicetrainset 
(SELECT id,14,pn17,class,1 
 FROM   splicetrain); 

INSERT INTO splicetrainset 
(SELECT id,15,pn16,class,1 
 FROM   splicetrain); 

INSERT INTO splicetrainset 
(SELECT id,16,pn15,class,1 
 FROM   splicetrain); 

INSERT INTO splicetrainset 
(SELECT id,17,pn14,class,1 
 FROM   splicetrain); 

INSERT INTO splicetrainset 
(SELECT id,18,pn13,class,1 
 FROM   splicetrain); 

INSERT INTO splicetrainset 
(SELECT id,19,pn12,class,1 
 FROM   splicetrain); 

INSERT INTO splicetrainset 
(SELECT id,20,pn11,class,1 
 FROM   splicetrain); 

INSERT INTO splicetrainset 
(SELECT id,21,pn10,class,1 
 FROM   splicetrain); 

INSERT INTO splicetrainset 
(SELECT id,22,pn9,class,1 
 FROM   splicetrain); 

INSERT INTO splicetrainset 
(SELECT id,23,pn8,class,1 
 FROM   splicetrain); 

INSERT INTO splicetrainset 
(SELECT id,24,pn7,class,1 
 FROM   splicetrain); 

INSERT INTO splicetrainset 
(SELECT id,25,pn5,class,1 
 FROM   splicetrain); 

INSERT INTO splicetrainset 
(SELECT id,26,pn4,class,1 
 FROM   splicetrain); 

INSERT INTO splicetrainset 
(SELECT id,27,pn3,class,1 
 FROM   splicetrain); 

INSERT INTO splicetrainset 
(SELECT id,28,pn2,class,1 
 FROM   splicetrain); 

INSERT INTO splicetrainset 
(SELECT id,29,pn1,class,1 
 FROM   splicetrain); 

INSERT INTO splicetrainset 
(SELECT id,30,p1,class,1 
 FROM   splicetrain); 

INSERT INTO splicetrainset 
(SELECT id,31,p2,class,1 
 FROM   splicetrain); 

INSERT INTO splicetrainset 
(SELECT id,32,p3,class,1 
 FROM   splicetrain); 

INSERT INTO splicetrainset 
(SELECT id,33,p4,class,1 
 FROM   splicetrain); 

INSERT INTO splicetrainset 
(SELECT id,34,p5,class,1 
 FROM   splicetrain); 

INSERT INTO splicetrainset 
(SELECT id,35,p6,class,1 
 FROM   splicetrain); 

INSERT INTO splicetrainset 
(SELECT id,36,p7,class,1 
 FROM   splicetrain); 

INSERT INTO splicetrainset 
(SELECT id,37,p8,class,1 
 FROM   splicetrain); 

INSERT INTO splicetrainset 
(SELECT id,38,p9,class,1 
 FROM   splicetrain); 

INSERT INTO splicetrainset 
(SELECT id,39,p10,class,1 
 FROM   splicetrain); 

INSERT INTO splicetrainset 
(SELECT id,40,p11,class,1 
 FROM   splicetrain); 

INSERT INTO splicetrainset 
(SELECT id,41,p12,class,1 
 FROM   splicetrain); 

INSERT INTO splicetrainset 
(SELECT id,42,p13,class,1 
 FROM   splicetrain); 

INSERT INTO splicetrainset 
(SELECT id,43,p14,class,1 
 FROM   splicetrain); 

INSERT INTO splicetrainset 
(SELECT id,44,p15,class,1 
 FROM   splicetrain); 

INSERT INTO splicetrainset 
(SELECT id,45,p16,class,1 
 FROM   splicetrain); 

INSERT INTO splicetrainset 
(SELECT id,46,p17,class,1 
 FROM   splicetrain); 

INSERT INTO splicetrainset 
(SELECT id,47,p18,class,1 
 FROM   splicetrain); 

INSERT INTO splicetrainset 
(SELECT id,48,p19,class,1 
 FROM   splicetrain); 

INSERT INTO splicetrainset 
(SELECT id,49,p20,class,1 
 FROM   splicetrain); 

INSERT INTO splicetrainset 
(SELECT id,50,p21,class,1 
 FROM   splicetrain); 

INSERT INTO splicetrainset 
(SELECT id,51,p22,class,1 
 FROM   splicetrain); 

INSERT INTO splicetrainset 
(SELECT id,52,p23,class,1 
 FROM   splicetrain); 

INSERT INTO splicetrainset 
(SELECT id,53,p24,class,1 
 FROM   splicetrain); 

INSERT INTO splicetrainset 
(SELECT id,54,p25,class,1 
 FROM   splicetrain); 

INSERT INTO splicetrainset 
(SELECT id,55,p26,class,1 
 FROM   splicetrain); 

INSERT INTO splicetrainset 
(SELECT id,56,p27,class,1 
 FROM   splicetrain); 

INSERT INTO splicetrainset 
(SELECT id,57,p28,class,1 
 FROM   splicetrain); 

INSERT INTO splicetrainset 
(SELECT id,58,p29,class,1 
 FROM   splicetrain); 

INSERT INTO splicetrainset 
(SELECT id,59,p30,class,1 
 FROM   splicetrain); 

terminate; 