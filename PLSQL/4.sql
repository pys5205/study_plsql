--accept 변수 prompt '문자열'		// [&변수]형태로 프로그램 내에서 사용

set serveroutput on
set verify off

accept num prompt '숫자입력->'

begin
	dbms_output.put_line('입력받은 숫자-> ' || &num);
end;
/

