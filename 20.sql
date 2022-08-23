/*
create table emp (
    eid number(5) primary key,
    ename varchar2(10),
    loan_ck varchar2(5)
);
create table loan(
    empid number(5),
    account number(5),
    loan_date date,
    constraint loan_empid_fk foreign key(empid) references emp(eid)
);
insert into emp(eid, ename, loan_ck) values(1, '¹Ú', 'N');
insert into emp(eid, ename, loan_ck) values(2, 'ÀÌ', 'N');
insert into emp(eid, ename, loan_ck) values(3, '±è', 'N');

*/


create or replace trigger emp_loan
    after insert or update of empid or delete on loan
    for each row

begin
    if inserting then
        update emp set loan_ck = 'Y' where eid = :new.empid;
    elsif deleting then
        update emp set loan_ck = 'N' where eid = :old.empid;
    elsif updating then
        update emp set loan_ck = 'Y' where eid = :new.empid;
        update emp set loan_ck = 'N' where eid = :old.empid;
    end if;    
end;
/
--insert into loan(empid, account, loan_date) values (1, 2000, sysdate);