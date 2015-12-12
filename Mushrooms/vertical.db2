
connect to sample;
drop table mushroomstestset;
drop table mushroomstrainset;
create table mushroomstestset(id INTEGER, type INTEGER, dataval varchar(1), class varchar(1), known INTEGER);
create table mushroomstrainset(id INTEGER, type INTEGER, dataval varchar(1), class varchar(1), known INTEGER);


INSERT INTO mushroomstestset (select id, 1,capshape, class, 1 from mushroomstest);
INSERT INTO mushroomstestset (select id, 2,capsurface, class, 1 from mushroomstest);
INSERT INTO mushroomstestset (select id, 3,capcolour, class, 1 from mushroomstest);
INSERT INTO mushroomstestset (select id, 4,bruise , class, 1 from mushroomstest);
INSERT INTO mushroomstestset (select id, 5,odor, class, 1 from mushroomstest);
INSERT INTO mushroomstestset (select id, 6,attchmnt, class, 1 from mushroomstest);
INSERT INTO mushroomstestset (select id, 7,spacing, class, 1 from mushroomstest);
INSERT INTO mushroomstestset (select id, 8,size, class, 1 from mushroomstest);
INSERT INTO mushroomstestset (select id, 9,colour, class, 1 from mushroomstest);
INSERT INTO mushroomstestset (select id, 10,shape, class, 1 from mushroomstest);
INSERT INTO mushroomstestset (select id, 11,root, class, 1 from mushroomstest);
INSERT INTO mushroomstestset (select id, 12,sAbv, class, 1 from mushroomstest);
INSERT INTO mushroomstestset (select id, 13,sBelw, class, 1 from mushroomstest);
INSERT INTO mushroomstestset (select id, 14,cAbv, class, 1 from mushroomstest);
INSERT INTO mushroomstestset (select id, 15,cBelw, class, 1 from mushroomstest);
INSERT INTO mushroomstestset (select id, 16,vType, class, 1 from mushroomstest);
INSERT INTO mushroomstestset (select id, 17,vColour, class, 1 from mushroomstest);
INSERT INTO mushroomstestset (select id, 18,rNumber, class, 1 from mushroomstest);
INSERT INTO mushroomstestset (select id, 19,rType, class, 1 from mushroomstest);
INSERT INTO mushroomstestset (select id, 20,sColour, class, 1 from mushroomstest);
INSERT INTO mushroomstestset (select id, 21,pop, class, 1 from mushroomstest);
INSERT INTO mushroomstestset (select id, 22,habitat, class, 1 from mushroomstest);



INSERT INTO mushroomstrainset (select id, 1,capshape, class, 1 from mushroomstrain);
INSERT INTO mushroomstrainset (select id, 2,capsurface, class, 1 from mushroomstrain);
INSERT INTO mushroomstrainset (select id, 3,capcolour, class, 1 from mushroomstrain);
INSERT INTO mushroomstrainset (select id, 4,bruise , class, 1 from mushroomstrain);
INSERT INTO mushroomstrainset (select id, 5,odor, class, 1 from mushroomstrain);
INSERT INTO mushroomstrainset (select id, 6,attchmnt, class, 1 from mushroomstrain);
INSERT INTO mushroomstrainset (select id, 7,spacing, class, 1 from mushroomstrain);
INSERT INTO mushroomstrainset (select id, 8,size, class, 1 from mushroomstrain);
INSERT INTO mushroomstrainset (select id, 9,colour, class, 1 from mushroomstrain);
INSERT INTO mushroomstrainset (select id, 10,shape, class, 1 from mushroomstrain);
INSERT INTO mushroomstrainset (select id, 11,root, class, 1 from mushroomstrain);
INSERT INTO mushroomstrainset (select id, 12,sAbv, class, 1 from mushroomstrain);
INSERT INTO mushroomstrainset (select id, 13,sBelw, class, 1 from mushroomstrain);
INSERT INTO mushroomstrainset (select id, 14,cAbv, class, 1 from mushroomstrain);
INSERT INTO mushroomstrainset (select id, 15,cBelw, class, 1 from mushroomstrain);
INSERT INTO mushroomstrainset (select id, 16,vType, class, 1 from mushroomstrain);
INSERT INTO mushroomstrainset (select id, 17,vColour, class, 1 from mushroomstrain);
INSERT INTO mushroomstrainset (select id, 18,rNumber, class, 1 from mushroomstrain);
INSERT INTO mushroomstrainset (select id, 19,rType, class, 1 from mushroomstrain);
INSERT INTO mushroomstrainset (select id, 20,sColour, class, 1 from mushroomstrain);
INSERT INTO mushroomstrainset (select id, 21,pop, class, 1 from mushroomstrain);
INSERT INTO mushroomstrainset (select id, 22,habitat, class, 1 from mushroomstrain);

update mushroomstrainset set known=0  where dataval='?';
update mushroomstestset set known=0  where dataval='?';

terminate;


