--��� ���̺� ��� ������ �Է��ϴ� ���ν���
--����� �������� �̿��ϰ�(201~299, 2�� ����) �ۿ��� ���� ���Ķ���� ������ ��������
--�Ի����� ���糯¥�� �Էµǰ�,
--Ŀ�̼��� ��å ���ǿ� ���� �Է�(��å�� �븮 -> �޿��� 10%, ���� -> 15%, ���� -> �޿��� 20%, �� ���� ��å-> 0)
--�����ڹ�ȣ�� �μ��� �������̸�, 3�� ����� �Է��ϰ�, �ѹ����̸� 10�� ����� �Է��ϰ�, ������̸� 6�� ����� �Էµǵ��� �Ѵ�.

--ȣ������
--exec p_sawon_in('ȫ����', 3000, '�븮', '����', '������');
-- show error procedure p_sawon_in; ���� ã��
create or replace procedure p_sawon_in
(v_name sawon.saname%type,
v_pay sawon.sapay%type,
v_job sawon.sajob%type,
v_sex sawon.sasex%type,
v_dname dept.dname%type)

is
v_comm sawon.comm%type;
v_mgr sawon.samgr%type;
v_deptno sawon.deptno%type;
begin
--����� �������� �̿��ϰ�(201~299, 2�� ����) �ۿ��� ���� ���Ķ���� ������ ��������
  --  create sequence s_bun
  --      increment by 2
  --      start with 201
    --     maxvalue 299;

--�Ի����� ���糯¥�� �Էµǰ�,

--Ŀ�̼��� ��å ���ǿ� ���� �Է�(��å�� �븮 -> �޿��� 10%, ���� -> 15%, ���� -> �޿��� 20%, �� ���� ��å-> 0)
    select deptno into v_deptno from dept where dname = v_dname;

    if v_job = '�븮' then  
        v_comm := v_pay*0.1;
    elsif v_job = '����' then  
        v_comm := v_pay*0.2;
    elsif v_job = '����' then  
        v_comm := v_pay*0.15;
    else v_comm := 0;
    end if;

-- �����ڹ�ȣ�� �μ��� �������̸�, 3�� ����� �Է��ϰ�, �ѹ����̸� 10�� ����� �Է��ϰ�, ������̸� 6�� ����� �Էµǵ��� �Ѵ�.
    if v_dname = '������' then
        v_mgr := 3;
    elsif v_dname = '�ѹ���' then
        v_mgr := 10;
    elsif v_dname = '�����' then
        v_mgr := 6;
    else v_mgr := 0;
    end if;


    insert into sawon (sabun, saname, deptno, sajob, sapay, sahire, sasex, samgr, comm)
        values(s_bun.nextval, v_name, v_deptno, v_job, v_pay,sysdate, v_sex, v_mgr, v_comm);
end;
/