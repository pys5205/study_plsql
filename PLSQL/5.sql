accept bun prompt '���->'

--�Էµ� ����� ���� ����� �̸��� �޿��� ����ϴ� ���α׷�

declare
	v_name sawon.saname%type;
	v_pay sawon.saname%type;
begin
	select saname, sapay into v_name, v_pay from sawon where sabun=&bun;
	dbms_output.put_line('�̸�:' || v_name ||', �޿���'|| v_pay);
end;
/

--*** PL/SQL������ ���� ���� ���
--v_name 	sawon.saname%type;		// sawon.saname�� ���� Ÿ��(����) ���� �Ӽ�
--v_pay  constant  sawon.sapay%type := 2000;   	// ���� �Ұ����� ����� ���� ����!
--v_bun  		sawon.sabun%type := 15 not null; 	// ������ not null ���༳��!
--v_loc		dept.loc%type := '����';
--a		sawon%rowtype;			// a.sabun, a.saname,... ������ �� ���� ����!!

