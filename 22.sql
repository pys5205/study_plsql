/*
create table black_list(
    sname varchar2(10) default user,
    time varchar2(30) default to_char(sysdate, 'yyyy-mm-dd hh24:mi:ss'),
    sabun number(5),
    beforepay number(5),
    afterpay number(5)
);
*/

create or replace trigger t_sawon_sapay
    after update of sapay on sawon
	for each row
    when (old.sajob!='����')

declare
    PRAGMA AUTONOMOUS_TRANSACTION;
begin
    --1. �޿� ���� �� �� ������ ����     20000 ~ 20999
    -- raise application_error(-20001,'�޿��� ������ �� �����ϴ�!!');

    --2. �޿��� ������ ���� (pys)��, ��¥(�ð�), ���, �������޿�, �����ı޿��� black_list table�� �Է�
   /* insert into black_list(sabun, beforepay, afterpay)
        values(:old.sabun, :old.sapay, :new.sapay);*/
        
    --3. �޿��� ������ �� ���� black_list table �� ���� ��� 
   /* insert into black_list(sabun, beforepay, afterpay)
        values(:old.sabun, :old.sapay, :new.sapay);
    commit;
    raise application_error(-20001,'�޿� ���� x, ���o');4*/

    --4. �����ϴ� �޿��� ������ �޿����� �� ���ų� 13�۸� �ʰ��ϴ� ��� '�������� ���� �ƴ϶�� ���� ���(��������)
    if ((:new.sapay < :old.sapay) or (:old.sapay*1.13 < :new.sapay)) then
    --and :old.sajob !='����' then
        raise_application_error(-22222, '��');
    end if;
    
end;
/


--Ʈ�l�� ���� ����
alter table table_name [enable | disable] all triggers;
alter trigger trigger_name [enable | disable];


