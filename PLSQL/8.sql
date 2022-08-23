set serveroutput on
set verify off

declare
   cursor mycur is select sabun, sapay from sawon;
--   v_name sawon.saname%type;
   v_pay sawon.sapay%type;
   v_sabun sawon.sabun%type;
   v_comm sawon.comm%type;
begin
   if mycur%isopen then close mycur;
   end if;

   open mycur;
   loop
      fetch mycur into v_sabun, v_pay;
      exit when(mycur%notfound);

      if v_pay < 1000 then
         v_comm:=v_pay*0.1;
      elsif v_pay <=2000 then
         v_comm:=v_pay*0.15;
      elsif v_pay > 2000 then
         v_comm:=v_pay*0.2;
      else
         v_comm:=0;
      end if;
      update sawon set comm=v_comm where sabun=v_sabun;
   end loop;
   close mycur;
   commit;
end;
/

