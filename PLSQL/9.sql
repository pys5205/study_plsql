--���, �����, �Ի���, �޿��� �о�鿩, �ٹ��Ⱓ, �޿������� ����Ͽ�  sawon_result table�� �Է�
create table sawon_result(
	sabun number(10) primary key,
	saname varchar2(20),
	sahire date,
	sapay number(10),
	work_bet varchar2(20),
	pay_rank number(3)
);
declare
   cursor mycur is select sabun, saname, sahire, sapay from sawon;
   v_work sawon_result.work_bet%type;
   v_rank sawon_result.pay_rank%type;
begin
   for i in mycur loop
--	//  �ٹ��Ⱓ
  	v_work := floor(months_between(sysdate, i.sahire)/12) || '�� ' || floor(mod(months_between(sysdate, i.sahire), 12)) || '����';
	
--	//�޿�����
	v_rank := 0;
  	select count(*) into v_rank from sawon where i.sapay < sapay;
	v_rank := v_rank + 1;

  	insert into sawon_result(sabun, saname, sahire, sapay, work_bet, pay_rank)
   			values(i.sabun, i.saname, i.sahire, i.sapay, v_work, v_rank);
   end loop;
   commit;
end;
/