-- for ī��Ʈ���� in �ʱⰪ..�ִ밪 loop ~ end loop
-- 1~10
/*
begin
	for i in 1..10 loop
		dbms_output.put_line('i�� �� -> '|| i);
	end loop;
end;
/
*/

-----------------------------------------------------------------------
-- while ���� loop ~ end loop;
/*
declare
	i number(4) := 1;
begin
	while i < 10 loop
		dbms_output.put_line('i�� �� -> '|| i);
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
		dbms_output.put_line('i�� �� -> '|| i);
		i := i+1;
		if i > 10 then
			 exit;
		end if;
		-- exit when (i > 10)
	end loop;
end;
/

