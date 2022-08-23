--주민번호의 유효성을 체크하는 함수
--select f_jumin_check('041201-3182518') from dual;

--1. 0 4 1 2 0 1 - 3 1 8 2 5 1 8
-- *
--   2 3 4 5 6 7   8 9 2 3 4 5
--2. 1번/11 나머지 = 3
--3. 11-2번 = 8
--4 3번 / 10 나머지 = 8

create or replace function f_jumin_check
    (v_jumin varchar2)
    return varchar2
-- return boolean
-- if j_jumin_check(jumin) then
        -- insert into sawon....
is
    jj number(7);
begin
    jj := substr(v_jumin,1,1)*2+substr(v_jumin,2,1)*3+substr(v_jumin,3,1)*4+substr(v_jumin,4,1)*5+substr(v_jumin,5,1)*6+substr(v_jumin,6,1)*7
         +substr(v_jumin,8,1)*8+substr(v_jumin,9,1)*9+substr(v_jumin,10,1)*2+substr(v_jumin,11,1)*3+substr(v_jumin,12,1)*4+substr(v_jumin,13,1)*5;
    if jj = 113 and mod(jj,11)=3 and 11 - mod(jj,11)=8 
                and mod(11-mod(jj,11),10) = 8 then
        return 'ㅇㅇ';
        -- return true;
    else    return 'ㄴㄴ';
        -- return false;
    end if;
end;
/
