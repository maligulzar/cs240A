connect to sample;
drop table mushrooms;
		Create Table Mushrooms(
		 id integer not null GENERATED ALWAYS AS IDENTITY (START WITH 1 INCREMENT BY 1, NO CACHE),
		 class varchar(1) ,
		 capshape varchar(1) ,  
		 capsurface varchar(1) ,
		 capcolour varchar(1) , 
		 bruise  varchar(1) , 
		 odor varchar(1) ,
		 attchmnt  varchar(1) ,
		 spacing  varchar(1) ,
		 size    varchar(1) ,  
		 colour  varchar(1) ,
		 shape  varchar(1) ,
		 root   varchar(1) ,  
		 sAbv   varchar(1) ,  
		 sBelw  varchar(1) ,  
		 cAbv    varchar(1) , 
		 cBelw  varchar(1) ,   
		vType  varchar(1) ,  
		 vColour varchar(1) , 
		 rNumber varchar(1) , 
		 rType  varchar(1) ,   
		 sColour varchar(1) ,  
		 pop   varchar(1) , 
		 habitat  varchar(1) 
		 );
import from "/home/db2inst1/work/Mushrooms/mushroom.data" of del modified by identitymissing insert into mushrooms;
 terminate;
