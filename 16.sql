-- �ֹι�ȣ ���� ���ڿ��� ������, ������ �����ϴ� �Լ�
create or replace function f_sex
    (v_sex varchar2)
        return varchar2

is
    sesex varchar2(10);
begin
    --�ֹ� �� ù�ڸ� 1,3 ����  2,4 ����
    if substr(v_sex, 8, 1) = 1 then
        sesex := '����';
    elsif substr(v_sex, 8, 1) = 3 then
        sesex := '����';
    else sesex:= '����';
    end if;
    return sesex;
end;
/
-- �ֹι�ȣ ���� ���ڿ��� ������, ������ �����ϴ� �Լ�
-- �ֹ� �յ��ڸ��� ���ڸ� 1,2 1900+  3,4 2000+ - sysdate+!
create or replace function f_age
    (v_age varchar2)
        return varchar2
is  
    age number(5);
begin
    if substr(v_age, 8, 1) in(1,2) then
        age := to_number(substr(v_age,1,2))+1900;
    else age := to_number(substr(v_age,1,2))+2000;
    end if;
    return to_char(sysdate, 'yyyy') - age + 1;
end;
/
--select goname, f_sex(gojumin) ����, f_age(gojumin) ���� from gogek;