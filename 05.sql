set serveroutput on
set verify off

accept bun prompt 'sabun ->'

declare
    v_name sawon.saname%type;
    v_sal sawon.sapay%type;
begin
    select saname into v_name from sawon where sabun = &bun;
    select sapay into v_sal from sawon where sabun = &bun;
    dbms_output.put_line('name = ' ||v_name);
    dbms_output.put_line('sal = '||v_sal);
end;
/


--*** PL/SQL������ ���� ���� ���
--v_name    sawon.saname%type;   // sawon.saname�� ���� Ÿ��(����) ���� �Ӽ�
--v_pay  constant  sawon.sapay%type := 2000;   // ���� �Ұ����� ����� ���� ����!
--v_bun        sawon.sabun%type := 15 not null; // ������ not null ���༳��!
--v_loc      dept.loc%type := '����';
--a      sawon%rowtype;      // a.sabun, a.saname,... ������ �� ���� ����!!

