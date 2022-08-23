-- 학생 성적 테이블
create table student(hakbun number(3), name varchar2(10), kor number(3), mat number(3), eng number(3));
insert into student values(101,'홍동우',90,80,60);
insert into student values(102,'차승원',80,75,60);
insert into student values(103,'현빈',90,60,60);
insert into student values(104,'강동원',55,40,60);
insert into student values(105,'주원',70,65,100);

-- 성적 결과 테이블
create table record(hakbun number(3), name varchar2(10), 
		kor number(3), mat number(3), eng number(3),
		total number(3), ave number(5,2), hakjum char(2), 
		grade char(10), s_rank number(3));

--*** 다중커서를 이용한 성적처리 구현 
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
            v_grade := '합격';
        else v_grade := '불합격';
        end if;

        insert into record(hakbun, name, kor, mat, eng, total, ave, hakjum, grade)
                      values(i.hakbun, i.name, i.kor, i.mat, i.eng, v_total, v_avg, v_hakjum, v_grade);
        cnt := mycur%rowcount;
    end loop;
    commit;
    dbms_output.put_line('처리된 학생수 -> ' || cnt);
--  // 커서
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

-- * 커서에서 사용하는 속성
--커서명%isopen : 커서가 열려있다
--커서명%notfound : 커서에서 가져올 행이 없다
--커서명%found : 커서에서 가져올 행이 있다
--커서명%rowcount : 커서가 처리한 행 수