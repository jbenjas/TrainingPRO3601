import $;
entre := $.File_crimes11.File.year>=2010 and $.File_crimes11.File.year<=2020;
recset := $.File_crimes11.File(entre);

rec := record
	recset.year;
	contagem := count(group);
end;


tab := table(recset,rec,year);
tab;

media := ave(tab,contagem);
media;