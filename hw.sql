create or replace function add_date
(v_sahire date,
addyear number,
addmonth number)
return varchar2

is
res varchar2(100);

begin
    res := v_sahire + to_yminterval(to_char(addyear, 00)||'-'||to_char(addmonth, 00));
    return res;
end;
/