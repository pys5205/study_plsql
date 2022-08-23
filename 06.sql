--입력받은 사번의 사원 커미션 변경
set serveroutput on
set verify off

accept bun prompt 'sabun -> '

declare
    v_comm sawon.comm%type;
    v_sal sawon.sapay%type;
begin
    select sapay into v_sal from sawon where sabun = &bun;
    if v_sal < 1000 then
        v_comm := v_sal*0.1;
    elsif v_sal <= 2000 then
        v_comm := v_sal*0.5;
    elsif v_sal > 2000 then
        v_comm := v_sal*0.2;
    else
        v_comm := 0;
    end if;

    update sawon set comm = v_comm where sabun = &bun;
    commit;

    dbms_output.put_line('bun = ' ||&bun);
    dbms_output.put_line('sal = '||v_sal);
    dbms_output.put_line('comm = ' ||v_comm);
end;
/
