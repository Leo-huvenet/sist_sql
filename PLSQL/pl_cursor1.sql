-- DEPT ���׺��� ��� �μ������� ��ȸ
set serveroutput on

declare
	--Ŀ������ ����� ���� ������ ����
	deptno dept.deptno%type;
	dname dept.dname%type;
	loc dept.loc%type;	
--	dept_row dept%rowtype; -- �����ͺ��̽� dept�÷� ��ü�� �����ؼ��� ����

	--1. Ŀ���� ���� cursor Ŀ���� is select,,,,,;
	cursor cur_dept is select deptno, dname, loc from dept;

begin

	if cur_dept%isopen then
	-- Ŀ���� ���� �ִٸ� �ݱ�
		close cur_dept;
	end if;

	--2. Ŀ������ : open Ŀ����;
    open cur_dept;

  --3. ���� : Ŀ���� ��ġ�� ���� �÷����� ��� �� fetch Ŀ���� into
    loop
    	fetch cur_dept into deptno, dname, loc;
			-- ����� ���ڵ尡 �������� ������ �ݺ����� ���� ������.
			exit when(cur_dept%notfound);
			-- ����� ���ڵ尡 �����ϸ� ���� ��´�.
--			if cur_dept%found then
    	dbms_output.put_line(deptno||' / '||dname||' / '|| loc);
--    	end if;

    end loop;


		--4. Ŀ�� �ݱ�
		close cur_dept;

		exception
		when invalid_cursor then
			dbms_output.put_line('Ŀ���� �߸��� ������ ����');
		when others then
			dbms_output.put_line();

end;
/

