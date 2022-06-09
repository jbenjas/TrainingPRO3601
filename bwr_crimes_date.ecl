import $, STD;

crimes := $.File_crime_optimized;

rec := record;
  UNSIGNED row_id;
	UNSIGNED day;
  UNSIGNED time;
	crimes.Layout AND NOT date;
END;

rec reformat(crimes.Layout Le, UNSIGNED cnt) := TRANSFORM
  SELF.row_id := cnt;
  SELF.day := STD.Date.FromStringToDate(Le.date[1..10], '%d/%m/%Y');
  SELF.time := STD.Date.TimeFromParts((UNSIGNED)Le.date[12..13],(UNSIGNED)Le.date[15..16],(UNSIGNED)Le.date[18..19]);
  SELF := Le;
END;
daytimeds := PROJECT(crimes.File,reformat(LEFT,COUNTER));

daytimeds;

EXPORT bwr_crimes_date := PROJECT(crimes.File,reformat(LEFT,COUNTER));