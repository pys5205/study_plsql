--복제구현
--dept table에 insert가 발생하면, dept_bk table에 입력이 발생하는 트리거
create table dept_bk as select * from dept;

create or replace trigger t_dept_in
	after insert on dept
	for each row
begin
	insert into dept_bk(deptno, dname, loc) values(:new.deptno, :new.dname, :new.loc);
end;
/
--행단위 트리거에서만 사용
--:new.컬럼명 : 입력 발생한 행의 컬럼값
--:old.컬럼명 : 삭제 발생한 행의 컬럼값
create or replace trigger t_dept_up
	after update on dept
	for each row
begin
	update dept_bk set deptno = :new.deptno, dname= :new.dname, loc = :new.loc
	where deptno = :old.deptno;
end;
/

create or replace trigger t_dept_de
	after delete on dept
	for each row
begin
	delete dept_bk where deptno = :old.deptno;
end;
/

------------------------------------------------------------------- 
create or replace trigger t_dept_backup
	after insert or update or delete on dept
	for each row
begin
	if inserting then
		insert into dept_bk(deptno, dname, loc) values(:new.deptno, :new.dname, :new.loc);
	elsif updating then
		update dept_bk set deptno = :new.deptno, dname= :new.dname, loc = :new.loc
		where deptno = :old.deptno;
	elsif deleting then
		delete dept_bk where deptno = :old.deptno;
	end if;
end;
/