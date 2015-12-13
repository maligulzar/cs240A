!db2start;CONNECT TO sample;DROP TABLE mushroomstest;DROP TABLE mushroomstrain;CREATE TABLE mushroomstest
             ( 
                          id         INTEGER NOT NULL , 
                          class      VARCHAR(1) , 
                          capshape   VARCHAR(1) , 
                          capsurface VARCHAR(1) , 
                          capcolour  VARCHAR(1) , 
                          bruise     VARCHAR(1) , 
                          odor       VARCHAR(1) , 
                          attchmnt   VARCHAR(1) , 
                          spacing    VARCHAR(1) , 
                          size       VARCHAR(1) , 
                          colour     VARCHAR(1) , 
                          shape      VARCHAR(1) , 
                          root       VARCHAR(1) , 
                          sabv       VARCHAR(1) , 
                          sbelw      VARCHAR(1) , 
                          cabv       VARCHAR(1) , 
                          cbelw      VARCHAR(1) , 
                          vtype      VARCHAR(1) , 
                          vcolour    VARCHAR(1) , 
                          rnumber    VARCHAR(1) , 
                          rtype      VARCHAR(1) , 
                          scolour    VARCHAR(1) , 
                          pop        VARCHAR(1) , 
                          habitat    VARCHAR(1) 
             );CREATE TABLE mushroomstrain 
             ( 
                          id         INTEGER NOT NULL , 
                          class      VARCHAR(1) , 
                          capshape   VARCHAR(1) , 
                          capsurface VARCHAR(1) , 
                          capcolour  VARCHAR(1) , 
                          bruise     VARCHAR(1) , 
                          odor       VARCHAR(1) , 
                          attchmnt   VARCHAR(1) , 
                          spacing    VARCHAR(1) , 
                          size       VARCHAR(1) , 
                          colour     VARCHAR(1) , 
                          shape      VARCHAR(1) , 
                          root       VARCHAR(1) , 
                          sabv       VARCHAR(1) , 
                          sbelw      VARCHAR(1) , 
                          cabv       VARCHAR(1) , 
                          cbelw      VARCHAR(1) , 
                          vtype      VARCHAR(1) , 
                          vcolour    VARCHAR(1) , 
                          rnumber    VARCHAR(1) , 
                          rtype      VARCHAR(1) , 
                          scolour    VARCHAR(1) , 
                          pop        VARCHAR(1) , 
                          habitat    VARCHAR(1) 
             );INSERT INTO mushroomstest 
            ( 
                   select * 
                   from   mushrooms 
                   WHERE  rand() < 0.25 
            );INSERT INTO mushroomstrain 
            ( 
                   select * 
                   from   mushrooms 
                   WHERE  id NOT IN 
                          ( 
                                 SELECT id 
                                 FROM   mushroomstest) 
            );terminate;