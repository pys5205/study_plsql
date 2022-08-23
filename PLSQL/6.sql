--alter table sawon add comm number(10);
-- 입력받은 사번의 사원 커미션을 변경하는 프로그램
-- 단, 급여가 1000미만     -> 급여의 10%
--	     1000~2000 -> 급여의 15%
--	     2000초과    -> 급여의 20%
--	     null	        -> 0
set serveroutput on
set verify off

accept bun prompt '사번->'
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
-- dbms_output.put_line('사번 : '|| &bun || ', 급여 : '|| v_pay|| ', 보너스 : '|| v_comm);
end;
/