set verify off

accept name prompt '�̸�: '
accept sal prompt '�޿�: '
accept job prompt '��å: '
accept sex prompt '����: '
accept dname prompt '�μ���: '

begin
    p_sawon_in('&name', &sal, '&job', '&sex', '&dname');
end;
/



