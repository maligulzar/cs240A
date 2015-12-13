CONNECT TO sample;DROP TABLE mushrooms;CREATE TABLE mushrooms 
             ( 
                          id         INTEGER NOT NULL generated always AS IDENTITY (start WITH 1 increment BY 1, no CACHE),
                          class      varchar(1) , 
                          capshape   varchar(1) , 
                          capsurface varchar(1) , 
                          capcolour  varchar(1) , 
                          bruise     varchar(1) , 
                          odor       varchar(1) , 
                          attchmnt   varchar(1) , 
                          spacing    varchar(1) , 
                          size       varchar(1) , 
                          colour     varchar(1) , 
                          shape      varchar(1) , 
                          root       varchar(1) , 
                          sabv       varchar(1) , 
                          sbelw      varchar(1) , 
                          cabv       varchar(1) , 
                          cbelw      varchar(1) , 
                          vtype      varchar(1) , 
                          vcolour    varchar(1) , 
                          rnumber    varchar(1) , 
                          rtype      varchar(1) , 
                          scolour    varchar(1) , 
                          pop        varchar(1),
                          habitant   varchar(1));
        import FROM "/home/db2inst1/work/Mushrooms/mushroom.data" OF del modified BY identitymissingINSERT INTO mushrooms;

terminate;