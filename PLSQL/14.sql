--��� ���̺� ��� ������ �����ϴ� ���ν���
--ȣ������
--exec p_sawon_up(201, 3500, '����', '������') ->201�� ����� ������ ������ ����� ����

--Ŀ�̼��� ��å�� ���ǿ� ���� �Է�(��å�� �븮 -> �޿��� 10%, ���� -> �޿��� 15%, ����-> �޿��� 20%, �� ���� ��å-> 0)
--�����ڹ�ȣ�� �μ��� �������̸�, 3�� ����� �Է��ϰ�, �ѹ����̸� 10�� ����� �Է��ϰ�, ������̸� 6�� ����� �Էµǵ��� �Ѵ�.

create or replace procedure p_sawon_up(
    v_sabun sawon.sabun%type,
    v_sapay sawon.sapay%type,
    v_sajob sawon.sajob%type,
    v_dname dept.dname%type )
is
begin
	update sawon
	set 	sapay = v_sapay,
		sajob = v_sajob,
		deptno = (select deptno from dept where dname=v_dname),
		comm = (case v_sajob when '�븮' then v_sapay*0.1 when '����' then v_sapay*0.15 when '����' then v_sapay*0.2 else 0 end),
		samgr = (case v_dname when '������' then 3 when '�ѹ���' then 10 when '�����' then 6 end)
	where sabun=v_sabun;
	commit;
end;
/
