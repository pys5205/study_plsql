--accept ���� prompt '���ڿ�'		// [&����]���·� ���α׷� ������ ���

set serveroutput on
set verify off

accept num prompt '�����Է�->'

begin
	dbms_output.put_line('�Է¹��� ����-> ' || &num);
end;
/

