/*
create table black_list(
    sname varchar2(10) default user,
    time varchar2(30) default to_char(sysdate, 'yyyy-mm-dd hh24:mi:ss'),
    sabun number(5),
    beforepay number(5),
    afterpay number(5)
);
*/

create or replace trigger t_sawon_sapay
    after update of sapay on sawon
	for each row
    when (old.sajob!='부장')

declare
    PRAGMA AUTONOMOUS_TRANSACTION;
begin
    --1. 급여 변경 할 수 없도록 에러     20000 ~ 20999
    -- raise application_error(-20001,'급여는 변경할 수 없습니다!!');

    --2. 급여를 변경한 세션 (pys)명, 날짜(시간), 사번, 변경전급여, 변경후급여를 black_list table에 입력
   /* insert into black_list(sabun, beforepay, afterpay)
        values(:old.sabun, :old.sapay, :new.sapay);*/
        
    --3. 급여는 변경할 수 없고 black_list table 에 정보 기록 
   /* insert into black_list(sabun, beforepay, afterpay)
        values(:old.sabun, :old.sapay, :new.sapay);
    commit;
    raise application_error(-20001,'급여 변경 x, 기록o');4*/

    --4. 변경하는 급여가 변경전 급여보다 더 적거나 13퍼를 초과하는 경우 '범위안의 값이 아니라는 에러 출력(부장제외)
    if ((:new.sapay < :old.sapay) or (:old.sapay*1.13 < :new.sapay)) then
    --and :old.sajob !='부장' then
        raise_application_error(-22222, '놉');
    end if;
    
end;
/


--트릐거 정보 변경
alter table table_name [enable | disable] all triggers;
alter trigger trigger_name [enable | disable];


