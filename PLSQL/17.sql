create or replace function f_name
	(v_name varchar2)
	return varchar2
is
begin
	return substr(v_name, 2, 3);
end;
/
--호출형태
select saname, f_name(saname) name from sawon;
select goname, f_name(goname) name from gogek;


