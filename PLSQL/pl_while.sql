-- 1~100���� �ݺ�����ϴ� while
set serveroutput on

declare

	i number;
begin

	i := 1; -- �ʱⰪ

	while i < 11 loop -- ���ǽ�
		dbms_output.put( i||' ' );
		i := i+1; --��.���ҽ�
	end loop;

	dbms_output.put_line(' ');

	-- 1 ~ 100���� ����ϴµ� 1 2 ¦ 4 5 ¦ 7 8 ¦ �� �������� ���

	i := 0; -- �ʱⰪ

	while i < 101 loop -- ���ǽ�
		if mod(i,3) = 0 then
			dbms_output.put('¦  ');
		else
		  dbms_output.put( i||' ');
		end if;
		i := i+1; --��.���ҽ�
	end loop;

	dbms_output.put_line(' ');
end;
/
