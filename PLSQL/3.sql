-- for 카운트변수 in 초기값..최대값 loop ~ end loop;

-- 1~10까지 출력
begin
	for i in 1..10 loop
		dbms_output.put_line('i의 값->' || i);
	end loop;
end;
/

-- while 조건 loop ~ end loop;
declare
	j number :=1;
begin
   while j <= 10 loop
      dbms_output.put_line('j의 값->'|| j);
      j := j+1;
   end loop;      
end;
/

-- loop ~ end loop;
-- exit;	// 제어블럭 빠져나가기

declare
   i number(4) := 1;
begin
   loop
   	dbms_output.put_line('i의 값->'|| i );
   	i:= i +1;
   	exit when (i >10);
   end loop;
end;
/