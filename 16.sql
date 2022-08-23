-- 주민번호 형태 문자열을 가지고, 성별을 리턴하는 함수
create or replace function f_sex
    (v_sex varchar2)
        return varchar2

is
    sesex varchar2(10);
begin
    --주민 뒤 첫자리 1,3 남자  2,4 여자
    if substr(v_sex, 8, 1) = 1 then
        sesex := '남자';
    elsif substr(v_sex, 8, 1) = 3 then
        sesex := '남자';
    else sesex:= '여자';
    end if;
    return sesex;
end;
/
-- 주민번호 형태 문자열을 가지고, 성별을 리턴하는 함수
-- 주민 앞두자리빼 뒷자리 1,2 1900+  3,4 2000+ - sysdate+!
create or replace function f_age
    (v_age varchar2)
        return varchar2
is  
    age number(5);
begin
    if substr(v_age, 8, 1) in(1,2) then
        age := to_number(substr(v_age,1,2))+1900;
    else age := to_number(substr(v_age,1,2))+2000;
    end if;
    return to_char(sysdate, 'yyyy') - age + 1;
end;
/
--select goname, f_sex(gojumin) 성벌, f_age(gojumin) 나이 from gogek;