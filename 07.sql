declare
    curser mycur is select saname from sawon;
begin
    if mycur%isopen then close mycur;
    end if;

    open mycur;
    loop
        select saname into v_name from sawon where sabun = &bun;
    end loop;
    close mycur;
end;
/