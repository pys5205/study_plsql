--��� ���̺� ��� ������ �Է��ϴ� ���ν���
--����� �������� �̿��ϰ�(201~299, 2������)
--�Ի����� ���糯¥�� �Էµǰ�,
--Ŀ�̼��� ��å ���ǿ� ���� �Է�(��å�� �븮 -> �޿��� 10%, ���� -> �޿��� 15%, ����-> �޿��� 20%, �� ���� ��å-> 0)
--�����ڹ�ȣ�� �μ��� �������̸�, 3�� ����� �Է��ϰ�, �ѹ����̸� 10�� ����� �Է��ϰ�, ������̸� 6�� ����� �Էµǵ��� �Ѵ�.

--ȣ������
--exec p_sawon_in('ȫ����', 3000, '�븮', '����', '������')

--������ ����
--create sequence sa_seq
--increment by 2
--start with 201
--maxvalue 299;

create or replace procedure p_sawon_in
   (v_name sawon.saname%type,
   v_pay sawon.sapay%type,
   v_job sawon.sajob%type,
   v_sex sawon.sasex%type,
-- v_dname dept.dname%type)
is
--   v_comm sawon.comm%type;
--   v_deptno sawon.deptno%type;
   v_mgr sawon.samgr%type;
begin
--    if v_job = '�븮' then
--      v_comm := v_pay*0.1;
--   elsif v_job = '����' then
--      v_comm := v_pay*0.15;
--   elsif v_job = '����' then
--      v_comm := v_pay*0.2;
--   else
--      v_comm := 0;
--   end if;

--   select deptno into v_deptno from dept where dname=v_dname;

   if v_dname = '������' then
      v_mgr := 3;
   elsif v_dname = '�ѹ���' then
      v_mgr := 10;
   elsif v_dname = '�����' then
      v_mgr :=6;
   else  dbms_output.put_line('�μ� �Է� ����');
   end if;

   insert into sawon (sabun, saname, sapay, sajob, sasex, deptno, comm, samgr, sahire)
--      values (s_sawon_sabun.nextval, v_saname, v_sapay, v_sajob,v_sasex, dname_dept, v_comm, v_samgr, sysdate);
   values (s_sawon_sabun.nextval, 
	v_saname, 
	v_sapay, 
	v_sajob,
	v_sasex, 
	(select deptno from dept where dname = v_dname), 
	(case v_sajob when '�븮' then v_sapay*0.1 when '����' then v_sapay*0.15 when '����' then v_sapay*0.2 else 0 end),
	v_samgr, 
	sysdate);
   commit;
end;
/
