
declare
	cursor mycur is select saname, sapay from sawon;
	v_name sawon.saname%type;
	v_pay sawon.saname%type;
begin
	if mycur%isopen then close mycur;
	end if;

	open mycur;
	loop
		fetch mycur into v_name, v_pay;
		exit when(mycur%notfound);

		dbms_output.put_line('�̸�:' || v_name ||', �޿���'|| v_pay);
	end loop;
	close mycur;
end;
/