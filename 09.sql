set serveroutput on
set verify off

declare
    cursor mycur is select sabun, saname, sahire, sapay from sawon;
    v_rank sawon_results.pay_rank%type;
    v_date sawon_results.work_bet%type;
begin 
    for i in mycur loop
        v_date := floor(months_between(sysdate, i.sahire)/12)||'년 '||
            mod(floor(months_between(sysdate, i.sahire)),12)||'개월';
        --update sawon_result set work_bet = v_date||' 년';

        v_rank := 0;
        select count(*) into v_rank from sawon where sapay > i.sapay;
        v_rank := v_rank +1;

        insert into sawon_results(sabun, saname, sahire, sapay, work_bet, pay_rank)
            values(i.sabun, i.saname, i.sahire, i.sapay, v_date, v_rank);
    end loop;
end;
/
/*
create table sawon_results(
   sabun number(10) primary key,
   saname varchar2(20),
   sahire date,
   sapay number(10),
   work_bet varchar2(20),
   pay_rank number(3)
);
*/