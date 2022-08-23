--사원 테이블에 사원 정보를 입력하는 프로시져
--사번은 시퀀스를 이용하고(201~299, 2씩증가)
--입사일은 현재날짜로 입력되고,
--커미션은 직책 조건에 따라 입력(직책이 대리 -> 급여의 10%, 과장 -> 급여의 15%, 부장-> 급여의 20%, 그 외의 직책-> 0)
--관리자번호는 부서가 영업부이면, 3번 사번을 입력하고, 총무부이면 10번 사번을 입력하고, 전산부이면 6번 사번을 입력되도록 한다.

--호출형태
--exec p_sawon_in('홍동우', 3000, '대리', '남자', '영업부')

--시퀀스 생성
--create sequence sa_seq
--increment by 2
--start with 201
--maxvalue 299;

create or replace procedure p_sawon_in
   (v_name sawon.saname%type,
   v_pay sawon.sapay%type,
   v_job sawon.sajob%type,
   v_sex sawon.sasex%type,
-- v_dname dept.dname%type)
is
--   v_comm sawon.comm%type;
--   v_deptno sawon.deptno%type;
   v_mgr sawon.samgr%type;
begin
--    if v_job = '대리' then
--      v_comm := v_pay*0.1;
--   elsif v_job = '과장' then
--      v_comm := v_pay*0.15;
--   elsif v_job = '부장' then
--      v_comm := v_pay*0.2;
--   else
--      v_comm := 0;
--   end if;

--   select deptno into v_deptno from dept where dname=v_dname;

   if v_dname = '영업부' then
      v_mgr := 3;
   elsif v_dname = '총무부' then
      v_mgr := 10;
   elsif v_dname = '전산부' then
      v_mgr :=6;
   else  dbms_output.put_line('부서 입력 에러');
   end if;

   insert into sawon (sabun, saname, sapay, sajob, sasex, deptno, comm, samgr, sahire)
--      values (s_sawon_sabun.nextval, v_saname, v_sapay, v_sajob,v_sasex, dname_dept, v_comm, v_samgr, sysdate);
   values (s_sawon_sabun.nextval, 
	v_saname, 
	v_sapay, 
	v_sajob,
	v_sasex, 
	(select deptno from dept where dname = v_dname), 
	(case v_sajob when '대리' then v_sapay*0.1 when '과장' then v_sapay*0.15 when '부장' then v_sapay*0.2 else 0 end),
	v_samgr, 
	sysdate);
   commit;
end;
/
