accept bun prompt '사번->'

--입력된 사번을 가진 사원의 이름과 급여를 출력하는 프로그램

declare
	v_name sawon.saname%type;
	v_pay sawon.saname%type;
begin
	select saname, sapay into v_name, v_pay from sawon where sabun=&bun;
	dbms_output.put_line('이름:' || v_name ||', 급여ㅣ'|| v_pay);
end;
/

--*** PL/SQL에서의 변수 선언 방법
--v_name 	sawon.saname%type;		// sawon.saname과 같은 타입(길이) 선언 속성
--v_pay  constant  sawon.sapay%type := 2000;   	// 변경 불가능한 상수형 변수 선언!
--v_bun  		sawon.sabun%type := 15 not null; 	// 변수에 not null 제약설정!
--v_loc		dept.loc%type := '서울';
--a		sawon%rowtype;			// a.sabun, a.saname,... 변수를 한 번에 선언!!

