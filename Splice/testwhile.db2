connect to sample;

begin atomic declare x integer default 1;set x=1; while x<10 Do set x = x+1; SELECT 'in while' FROM SYSIBM.SYSDUMMY1; END WHILe; END;

  SELECT 'after while' FROM SYSIBM.SYSDUMMY1;
terminate;