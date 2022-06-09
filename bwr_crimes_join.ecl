import $,std;

rec_part := $.file_crimes_part.rec_part;
rec_crimes := $.bwr_crimes_date.rec;
tab_part := $.bwr_crimes_rollup;
tab_crimes := $.bwr_crimes_date;

rec_chi_crim := record
  recordof(rec_crimes) AND NOT [block,communityarea,district];
  UNSIGNED local_id;
end;

rec_cri_crimes norm(rec_chi_crimes Le, rec_part Ri) := transform
  self := Le;
  self := Ri;
end;

tab_chi_crimes := SORT(JOIN(tab_crimes,tab_part,LEFT.block=RIGHT.block,norm(LEFT,RIGHT)),row_id);

tab_chi_crimes;