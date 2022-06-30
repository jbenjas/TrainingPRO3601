IMPORT $,STD;

EXPORT FunctionCrimes (STRING block_info):= FUNCTION

	crimes := $.NormCrimeRecs.IDX_Crimes; // baseky1
	addr := $.NormAddrRecs.IDX_Addr; // basekey2

	filter := 	addr(block=block_info);

	joinedrec := RECORD
    addr.block;
		crimes.primary_type;

	END;

	joinedrec MyJoin(crimes Le, filter Ri):= TRANSFORM
		SELF:=Le;
		SELF:=Ri;
END;

	jrecs:= JOIN(crimes,filter,
									LEFT.block_id=RIGHT.block_id, 
									MyJoin(LEFT, RIGHT),
									ALL);

	outrec := RECORD
		joinrecs.block;
	  joinrecs.primary_type;
	  unsigned cnt:=COUNT(GROUP);
	END;

  tab := TABLE(jrecs,outrec,primary_type);

	RETURN OUTPUT(tab);
END; 