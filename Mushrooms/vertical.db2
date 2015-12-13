CONNECT TO sample; 

DROP TABLE mushroomstestset; 

DROP TABLE mushroomstrainset; 

CREATE TABLE mushroomstestset 
  ( 
     id INTEGER,TYPE INTEGER,dataval VARCHAR(1),class VARCHAR(1),known INTEGER 
  ); 

CREATE TABLE mushroomstrainset 
  ( 
     id INTEGER,TYPE INTEGER,dataval VARCHAR(1),class VARCHAR(1),known INTEGER 
  ); 

INSERT INTO mushroomstestset 
(SELECT id,1,capshape,class,1 
 FROM   mushroomstest); 

INSERT INTO mushroomstestset 
(SELECT id,2,capsurface,class,1 
 FROM   mushroomstest); 

INSERT INTO mushroomstestset 
(SELECT id,3,capcolour,class,1 
 FROM   mushroomstest); 

INSERT INTO mushroomstestset 
(SELECT id,4,bruise,class,1 
 FROM   mushroomstest); 

INSERT INTO mushroomstestset 
(SELECT id,5,odor,class,1 
 FROM   mushroomstest); 

INSERT INTO mushroomstestset 
(SELECT id,6,attchmnt,class,1 
 FROM   mushroomstest); 

INSERT INTO mushroomstestset 
(SELECT id,7,spacing,class,1 
 FROM   mushroomstest); 

INSERT INTO mushroomstestset 
(SELECT id,8,size,class,1 
 FROM   mushroomstest); 

INSERT INTO mushroomstestset 
(SELECT id,9,colour,class,1 
 FROM   mushroomstest); 

INSERT INTO mushroomstestset 
(SELECT id,10,shape,class,1 
 FROM   mushroomstest); 

INSERT INTO mushroomstestset 
(SELECT id,11,root,class,1 
 FROM   mushroomstest); 

INSERT INTO mushroomstestset 
(SELECT id,12,sabv,class,1 
 FROM   mushroomstest); 

INSERT INTO mushroomstestset 
(SELECT id,13,sbelw,class,1 
 FROM   mushroomstest); 

INSERT INTO mushroomstestset 
(SELECT id,14,cabv,class,1 
 FROM   mushroomstest); 

INSERT INTO mushroomstestset 
(SELECT id,15,cbelw,class,1 
 FROM   mushroomstest); 

INSERT INTO mushroomstestset 
(SELECT id,16,vtype,class,1 
 FROM   mushroomstest); 

INSERT INTO mushroomstestset 
(SELECT id,17,vcolour,class,1 
 FROM   mushroomstest); 

INSERT INTO mushroomstestset 
(SELECT id,18,rnumber,class,1 
 FROM   mushroomstest); 

INSERT INTO mushroomstestset 
(SELECT id,19,rtype,class,1 
 FROM   mushroomstest); 

INSERT INTO mushroomstestset 
(SELECT id,20,scolour,class,1 
 FROM   mushroomstest); 

INSERT INTO mushroomstestset 
(SELECT id,21,pop,class,1 
 FROM   mushroomstest); 

INSERT INTO mushroomstestset 
(SELECT id,22,habitat,class,1 
 FROM   mushroomstest); 

INSERT INTO mushroomstrainset 
(SELECT id,1,capshape,class,1 
 FROM   mushroomstrain); 

INSERT INTO mushroomstrainset 
(SELECT id,2,capsurface,class,1 
 FROM   mushroomstrain); 

INSERT INTO mushroomstrainset 
(SELECT id,3,capcolour,class,1 
 FROM   mushroomstrain); 

INSERT INTO mushroomstrainset 
(SELECT id,4,bruise,class,1 
 FROM   mushroomstrain); 

INSERT INTO mushroomstrainset 
(SELECT id,5,odor,class,1 
 FROM   mushroomstrain); 

INSERT INTO mushroomstrainset 
(SELECT id,6,attchmnt,class,1 
 FROM   mushroomstrain); 

INSERT INTO mushroomstrainset 
(SELECT id,7,spacing,class,1 
 FROM   mushroomstrain); 

INSERT INTO mushroomstrainset 
(SELECT id,8,size,class,1 
 FROM   mushroomstrain); 

INSERT INTO mushroomstrainset 
(SELECT id,9,colour,class,1 
 FROM   mushroomstrain); 

INSERT INTO mushroomstrainset 
(SELECT id,10,shape,class,1 
 FROM   mushroomstrain); 

INSERT INTO mushroomstrainset 
(SELECT id,11,root,class,1 
 FROM   mushroomstrain); 

INSERT INTO mushroomstrainset 
(SELECT id,12,sabv,class,1 
 FROM   mushroomstrain); 

INSERT INTO mushroomstrainset 
(SELECT id,13,sbelw,class,1 
 FROM   mushroomstrain); 

INSERT INTO mushroomstrainset 
(SELECT id,14,cabv,class,1 
 FROM   mushroomstrain); 

INSERT INTO mushroomstrainset 
(SELECT id,15,cbelw,class,1 
 FROM   mushroomstrain); 

INSERT INTO mushroomstrainset 
(SELECT id,16,vtype,class,1 
 FROM   mushroomstrain); 

INSERT INTO mushroomstrainset 
(SELECT id,17,vcolour,class,1 
 FROM   mushroomstrain); 

INSERT INTO mushroomstrainset 
(SELECT id,18,rnumber,class,1 
 FROM   mushroomstrain); 

INSERT INTO mushroomstrainset 
(SELECT id,19,rtype,class,1 
 FROM   mushroomstrain); 

INSERT INTO mushroomstrainset 
(SELECT id,20,scolour,class,1 
 FROM   mushroomstrain); 

INSERT INTO mushroomstrainset 
(SELECT id,21,pop,class,1 
 FROM   mushroomstrain); 

INSERT INTO mushroomstrainset 
(SELECT id,22,habitat,class,1 
 FROM   mushroomstrain); 

UPDATE mushroomstrainset 
SET    known = 0 
WHERE  dataval = '?'; 

UPDATE mushroomstestset 
SET    known = 0 
WHERE  dataval = '?'; 

terminate; 