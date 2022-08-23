-- for 카운트변수 in 초기값..최대값 loop ~ end loop
-- 1~10
/*
begin
	for i in 1..10 loop
		dbms_output.put_line('i의 값 -> '|| i);
	end loop;
end;
/
*/

-----------------------------------------------------------------------
-- while 조건 loop ~ end loop;
/*
declare
	i number(4) := 1;
begin
	while i < 10 loop
		dbms_output.put_line('i의 값 -> '|| i);
		i := i+1;
	end loop;
end;
/
*/

-----------------------------------------------------------------------
-- loop ~ end loop;	exit;
declare
	i number(4) := 1;
begin
	loop
		dbms_output.put_line('i의 값 -> '|| i);
		i := i+1;
		if i > 10 then
			 exit;
		end if;
		-- exit when (i > 10)
	end loop;
end;
/

