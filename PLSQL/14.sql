--사원 테이블에 사원 정보를 변경하는 프로시져
--호출형태
--exec p_sawon_up(201, 3500, '과장', '관리부') ->201번 사원의 정보를 지정한 값들로 변경

--커미션은 직책의 조건에 따라 입력(직책이 대리 -> 급여의 10%, 과장 -> 급여의 15%, 부장-> 급여의 20%, 그 외의 직책-> 0)
--관리자번호는 부서가 영업부이면, 3번 사번을 입력하고, 총무부이면 10번 사번을 입력하고, 전산부이면 6번 사번을 입력되도록 한다.

create or replace procedure p_sawon_up(
    v_sabun sawon.sabun%type,
    v_sapay sawon.sapay%type,
    v_sajob sawon.sajob%type,
    v_dname dept.dname%type )
is
begin
	update sawon
	set 	sapay = v_sapay,
		sajob = v_sajob,
		deptno = (select deptno from dept where dname=v_dname),
		comm = (case v_sajob when '대리' then v_sapay*0.1 when '과장' then v_sapay*0.15 when '부장' then v_sapay*0.2 else 0 end),
		samgr = (case v_dname when '영업부' then 3 when '총무부' then 10 when '전산부' then 6 end)
	where sabun=v_sabun;
	commit;
end;
/
