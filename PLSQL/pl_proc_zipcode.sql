-- ���� �Է¹޾� �����ȣ, �õ�, ����, ��, ������ ����ϴ� PL/SQL
create or replace procedure proc_zipcode(dong varchar2,cur_zip out sys_refcursor)
is

i_dong varchar2(100) := dong;
begin

-- ���� �Էµ��� ������
	if i_dong is null then
		 i_dong := '�󵵵�';
	end if;

-- Ŀ�� ����
	open cur_zip for
		select zipcode, sido, gugun, dong, nvl(bunji, ' ') bunji
		from   zipcode
		where  dong like i_dong||'%';

end;
/
select * from CP_EMP2 ;
delete from cp_emp2 where 

