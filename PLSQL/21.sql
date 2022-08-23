create table info(info varchar2(20));

create or replace trigger t_ex
	after insert on dept_ex
	for each row
begin
	insert into info values('부서행입력');
end;
/
