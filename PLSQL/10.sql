-- �л� ���� ���̺�
create table student(hakbun number(3), name varchar2(10), kor number(3), mat number(3), eng number(3));
insert into student values(101,'ȫ����',90,80,60);
insert into student values(102,'���¿�',80,75,60);
insert into student values(103,'����',90,60,60);
insert into student values(104,'������',55,40,60);
insert into student values(105,'�ֿ�',70,65,100);

-- ���� ��� ���̺�
create table record(hakbun number(3), name varchar2(10), 
		kor number(3), mat number(3), eng number(3),
		total number(3), ave number(5,2), hakjum char(2), 
		grade char(10), s_rank number(3));

--*** ����Ŀ���� �̿��� ����ó�� ���� 
set serveroutput on
set verify off

declare
    cursor mycur is select hakbun, name, kor, mat, eng from student;
    v_total record.total%type;
    v_avg record.ave%type;
    v_hakjum record.hakjum%type;
    v_grade record.grade%type;
    cnt number(3) := 0;
begin
    for i in mycur loop
        v_total := i.kor+i.mat+i.eng;
        v_avg := v_total/3;

        if v_avg >= 90 then
            v_hakjum := 'A';
        elsif v_avg >= 80 then
            v_hakjum := 'B';
        elsif v_avg >= 70 then
            v_hakjum := 'C';
        elsif v_avg >= 60 then
            v_hakjum := 'D';
        else v_hakjum := 'F';     
        end if;

        if v_avg >=70 then
            v_grade := '�հ�';
        else v_grade := '���հ�';
        end if;

        insert into record(hakbun, name, kor, mat, eng, total, ave, hakjum, grade)
                      values(i.hakbun, i.name, i.kor, i.mat, i.eng, v_total, v_avg, v_hakjum, v_grade);
        cnt := mycur%rowcount;
    end loop;
    commit;
    dbms_output.put_line('ó���� �л��� -> ' || cnt);
--  // Ŀ��
    declare 
        cursor rankcur is select hakbun, total from record;
        v_rank record.s_rank%type;
    begin
        for j in rankcur loop
           v_rank := 0;
           select count(*) into v_rank from record where total > j.total;
           v_rank := v_rank +1;

           update record set s_rank = v_rank where hakbun = j.hakbun;
    end loop;
    commit;
    end;
end;
/

-- * Ŀ������ ����ϴ� �Ӽ�
--Ŀ����%isopen : Ŀ���� �����ִ�
--Ŀ����%notfound : Ŀ������ ������ ���� ����
--Ŀ����%found : Ŀ������ ������ ���� �ִ�
--Ŀ����%rowcount : Ŀ���� ó���� �� ��