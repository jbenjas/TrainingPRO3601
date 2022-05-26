EXPORT File_crimes := MODULE
	EXPORT Layout := record
    UNSIGNED4 id;
    STRING9 casenumber;
    STRING22 datetime;
    STRING38 block;
    STRING4 iucr;
    STRING33 primarytype;
    STRING60 description;
    STRING53 locationdescription;
    BOOLEAN arrest;
    BOOLEAN domestic;
    STRING4 beat;
    STRING3 discrit;
    UNSIGNED1 ward;
    UNSIGNED1 communityarea;
    STRING3 fbicode;
    UNSIGNED4 xcoordinate;
    UNSIGNED4 ycoordinate;
    UNSIGNED2 year;
    STRING22 updatedon;
    REAL8 latitude;
    REAL8 longitude;
    STRING29 location;
		end;
	export file := dataset('~class::intro::jbg::crimes_-_2001_to_present.csv', Layout, csv(heading(1)));
end;