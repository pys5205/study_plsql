--�ֹι�ȣ ������ ���ڿ��� ������, ������ �����ϴ� �Լ�
create or replace function f_sex
   (v_jumin varchar2)
   return varchar2
is 
begin
   if substr(v_jumin,8,1) in (1,3)  then
      return '����';
   else
      return '����';
   end if;
end;
/

--�ֹι�ȣ ������ ���ڿ��� ������, ���̸� �����ϴ� �Լ�
create or replace function f_age
    (v_jumin varchar2)
    return varchar2
is  
begin
     if substr(v_jumin,8,1) in (1,2) then
      return to_number(to_char(sysdate,'yyyy'))-(1900+to_number(substr(v_jumin,1,2)));
   else
      return to_number(to_char(sysdate,'yyyy'))-(2000+to_number(substr(v_jumin,1,2)));
   end if;  
end;
/

--ȣ������
select goname, f_sex(gojumin) ����, f_age(gojumin) ���� from gogek;
