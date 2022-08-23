declare
    cursor mycur is select sabun, sapay from sawon;

    v_comm sawon.comm%type;
    v_sal sawon.sapay%type;
    v_bun sawon.sabun%type;
begin
    if mycur%isopen then close mycur;
    end if;

    open mycur;
    loop
        fetch mycur into v_bun ,v_sal;
        exit when(mycur%notfound);

        if v_sal < 1000 then
            v_comm := v_sal*0.1;
        elsif v_sal <= 2000 then
            v_comm := v_sal*0.15;
        elsif v_sal > 2000 then
            v_comm := v_sal*0.2;
        else
            v_comm := 0;
        end if;

        update sawon set comm = v_comm where v_bun = sabun;
        commit;

    end loop;
    close mycur;
end;
/