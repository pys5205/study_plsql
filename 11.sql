create or replace procedure p_sawon_del 
(v_bun sawon.sabun%type)
is
begin
    delete sawon where sabun = v_bun;
end;
/
--exec p_sawon_del(12); 

/****  Procedure(���ν���)
--���� ����Ǵ� SQL & PL/SQL�� �̸� ������ -> ȣ��(����)�� �ؼ� ����ϴ� ��ü
--���� 
   ������ ó��(DML) -> ��� ���̺��� �ݵ�� ����***
   ���� ���(�ӵ� ����) -> �� ���� �����Ϸ� ȣ�⸸ �ؼ� ���
   �޸� ���� -> ������ ���ν����� ���� ����ڰ� ȣ���ϴ��� �ϳ��� �޸� ���

--���̺��� �ƴ� ���ν��� ������ �������� �ο��ϹǷ� ���ȼ��� ��ȭ
grant execute on ���ν��� to ~

--�Ķ���� ���� mode(type�� ����!->���̴� ���� �ȵ�)
   -in mode : ȣ��� �� ���� �޴� ���� ***
   -out mode : ���ν����� ȣ��� �� ������� ȣ���� ���� �Ѱ��ִ� ����
   -in out mode : ȣ���Ҷ� ���� ���� ����� ����� �Ѱ��ִ� ����

--����
create or repalce procedure pro_name
   (�Ķ���ͺ��� [(in) | out] type,...)
is
--���� ���� ����;
begin

end;
/
*/