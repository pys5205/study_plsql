create or replace trigger dept_casup
    after update of deptno on dept
    for each row

begin
    update sawon set deptno = :new.deptno 
    where deptno = :old.deptno;
end;
/
