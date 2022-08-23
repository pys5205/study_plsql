--주민번호 형태의 문자열을 가지고, 성별을 리턴하는 함수
create or replace function f_sex
   (v_jumin varchar2)
   return varchar2
is 
begin
   if substr(v_jumin,8,1) in (1,3)  then
      return '남자';
   else
      return '여자';
   end if;
end;
/

--주민번호 형태의 문자열을 가지고, 나이를 리턴하는 함수
create or replace function f_age
    (v_jumin varchar2)
    return varchar2
is  
begin
     if substr(v_jumin,8,1) in (1,2) then
      return to_number(to_char(sysdate,'yyyy'))-(1900+to_number(substr(v_jumin,1,2)));
   else
      return to_number(to_char(sysdate,'yyyy'))-(2000+to_number(substr(v_jumin,1,2)));
   end if;  
end;
/

--호출형태
select goname, f_sex(gojumin) 성별, f_age(gojumin) 나이 from gogek;
