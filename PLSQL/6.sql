--alter table sawon add comm number(10);
-- �Է¹��� ����� ��� Ŀ�̼��� �����ϴ� ���α׷�
-- ��, �޿��� 1000�̸�     -> �޿��� 10%
--	     1000~2000 -> �޿��� 15%
--	     2000�ʰ�    -> �޿��� 20%
--	     null	        -> 0
set serveroutput on
set verify off

accept bun prompt '���->'
declare
   v_comm sawon.comm%type;
   v_pay sawon.sapay%type;
begin
   select sapay into v_pay from sawon where sabun = &bun;
   if v_pay < 1000 then
      v_comm := v_pay*0.1;
   elsif v_pay <= 2000 then
      v_comm := v_pay*0.15;
   elsif v_pay > 2000 then
      v_comm := v_pay*0.20;
   else
      v_comm := 0;
   end if;
   
   update sawon set comm = v_comm where sabun = &bun;
   commit;
-- dbms_output.put_line('��� : '|| &bun || ', �޿� : '|| v_pay|| ', ���ʽ� : '|| v_comm);
end;
/