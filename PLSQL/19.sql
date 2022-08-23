--PL/SQL 내에서만 사용하는 데이터 타입 : boolean (true / false)
--주민번호를 가지고 유효성을 체크하는 함수
--select f_jumin_check('041201-3182518') from dual;  // 유효 or 비유효

--1. 0 4 1 2 0 1 - 3 1 8 2 5 1 8
--    * 
--   2 3 4 5 6 7   8 9 2 3 4 5 = (0*2)+(4*3)+... = 0+12+4+10+0+7+24+9+16+6+20+5 = 113
--2. 1번결과/11 나머지 = 3
--3. 11-2번결과           = 8
--4. 3번결과/10 나머지 = 8 => 주민번호 마지막 숫자와 같다면 유효

create or replace function f_jumin_check
   (jumin varchar2)
   return varchar2
--return boolean
is
   v_sut number(3);
begin
   v_sut := 
   mod(11-mod((substr(jumin,1,1)*2)+(substr(jumin,2,1)*3) + (substr(jumin,3,1)*4) +
	(substr(jumin,4,1)*5) +(substr(jumin,5,1)*6) + (substr(jumin,6,1)*7) + 
	(substr(jumin,8,1)*8) + (substr(jumin,9,1)*9) + (substr(jumin,10,1)*2) +
	(substr(jumin,11,1)*3) + (substr(jumin,12,1)*4) + (substr(jumin,13,1)*5),11),10);

   if v_sut = substr(jumin,-1) then
      return '유효';
--   returm true;
   else
      return '비유효';
   end if;
end;
/

select f_jumin_check('041201-3182518') from dual;

--사원정보 입력(insert 프로시져)
--if f_jumin_check(jumin) then
--	insert into sawon....


