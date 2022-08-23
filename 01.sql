set serveroutput on

declare 
	-- int i = 10;
	i number(4) := 10;
	a number(4) := 20;
	v varchar2(10) ;
begin
	-- print(i);
	dbms_output.put_line('i ÀÇ °ª->'|| sysdate);
	v := substr(show user, 8, 3);
	
end;
/