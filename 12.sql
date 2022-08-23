--사원 테이블에 사원 정보를 입력하는 프로시져
--사번은 시퀀스를 이용하고(201~299, 2씩 증가) 밖에서 만들어서 인파라미터 안으로 가져오기
--입사일은 현재날짜로 입력되고,
--커미션은 직책 조건에 따라 입력(직책이 대리 -> 급여의 10%, 과장 -> 15%, 부장 -> 급여의 20%, 그 외의 직책-> 0)
--관리자번호는 부서가 영업부이면, 3번 사번을 입력하고, 총무부이면 10번 사번을 입력하고, 전산부이면 6번 사번을 입력되도록 한다.

--호출형태
--exec p_sawon_in('홍동우', 3000, '대리', '남자', '영업부');
-- show error procedure p_sawon_in; 에러 찾기
create or replace procedure p_sawon_in
(v_name sawon.saname%type,
v_pay sawon.sapay%type,
v_job sawon.sajob%type,
v_sex sawon.sasex%type,
v_dname dept.dname%type)

is
v_comm sawon.comm%type;
v_mgr sawon.samgr%type;
v_deptno sawon.deptno%type;
begin
--사번은 시퀀스를 이용하고(201~299, 2씩 증가) 밖에서 만들어서 인파라미터 안으로 가져오기
  --  create sequence s_bun
  --      increment by 2
  --      start with 201
    --     maxvalue 299;

--입사일은 현재날짜로 입력되고,

--커미션은 직책 조건에 따라 입력(직책이 대리 -> 급여의 10%, 과장 -> 15%, 부장 -> 급여의 20%, 그 외의 직책-> 0)
    select deptno into v_deptno from dept where dname = v_dname;

    if v_job = '대리' then  
        v_comm := v_pay*0.1;
    elsif v_job = '부장' then  
        v_comm := v_pay*0.2;
    elsif v_job = '과장' then  
        v_comm := v_pay*0.15;
    else v_comm := 0;
    end if;

-- 관리자번호는 부서가 영업부이면, 3번 사번을 입력하고, 총무부이면 10번 사번을 입력하고, 전산부이면 6번 사번을 입력되도록 한다.
    if v_dname = '영업부' then
        v_mgr := 3;
    elsif v_dname = '총무부' then
        v_mgr := 10;
    elsif v_dname = '전산부' then
        v_mgr := 6;
    else v_mgr := 0;
    end if;


    insert into sawon (sabun, saname, deptno, sajob, sapay, sahire, sasex, samgr, comm)
        values(s_bun.nextval, v_name, v_deptno, v_job, v_pay,sysdate, v_sex, v_mgr, v_comm);
end;
/