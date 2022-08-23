-- if 조건 then
-- 	명령;
-- elsif 조건 then
--	명령;
-- else 명령;
-- end if;

declare
	i number(4) := 10;
begin
	if i > 10 then
		dbms_output.put_line('i 는 10보다 큽니다.');
	elsif i < 10 then
		dbms_output.put_line('i 는 10보다 작습니다.');
	else dbms_output.put_line('i 는 10입니다.');	
	end if;
end;
/