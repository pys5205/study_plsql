set serveroutput on

declare
--	int i = 10;
	i number(4) := 10;
begin
--	printf(i);
	dbms_output.put_line('i�� ��->' || i);
end;
/
