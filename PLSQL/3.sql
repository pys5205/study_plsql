-- for ī��Ʈ���� in �ʱⰪ..�ִ밪 loop ~ end loop;

-- 1~10���� ���
begin
	for i in 1..10 loop
		dbms_output.put_line('i�� ��->' || i);
	end loop;
end;
/

-- while ���� loop ~ end loop;
declare
	j number :=1;
begin
   while j <= 10 loop
      dbms_output.put_line('j�� ��->'|| j);
      j := j+1;
   end loop;      
end;
/

-- loop ~ end loop;
-- exit;	// ����� ����������

declare
   i number(4) := 1;
begin
   loop
   	dbms_output.put_line('i�� ��->'|| i );
   	i:= i +1;
   	exit when (i >10);
   end loop;
end;
/