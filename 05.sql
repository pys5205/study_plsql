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


--*** PL/SQL에서의 변수 선언 방법
--v_name    sawon.saname%type;   // sawon.saname과 같은 타입(길이) 선언 속성
--v_pay  constant  sawon.sapay%type := 2000;   // 변경 불가능한 상수형 변수 선언!
--v_bun        sawon.sabun%type := 15 not null; // 변수에 not null 제약설정!
--v_loc      dept.loc%type := '서울';
--a      sawon%rowtype;      // a.sabun, a.saname,... 변수를 한 번에 선언!!

