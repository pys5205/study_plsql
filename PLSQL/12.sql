create or replace procedure p_sawon_del
	(v_bun sawon_ex.sabun%type)
is
begin
	delete sawon_ex where sabun=v_bun;
end;
/

--호출형태
exec p_sawon_del(12)
