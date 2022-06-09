import $, std;

crimes := $.bwr_crimes_date;

rec_part := record;
  UNSIGNED part_id := crimes.row_id;
  crimes.block;
  crimes.communityarea;
  crimes.district;
  END;

tab_part := sort(table(crimes,rec_part));

rec_part norm(rec_part Le, rec_part Ri) := transform
  self.part_id := if(Le.part_id<Ri.part_id,Le.part_id,Ri.part_id);
  self := Le
end;
EXPORT bwr_crimes_rollup := ROLLUP(tab_part,LEFT.block=RIGHT.block, norm(LEFT,RIGHT));