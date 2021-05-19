
-- Homework0401_1�� ������ Ǯ��

set serveroutput on
set verify off

accept mgr prompt '�Ŵ��� ��ȣ �Է� : '

declare
	-- �����ȣ, �����, �μ���ȣ, �Ի���, ����
	type emp_rec is record(EMPNO emp.empno%type, ENAME emp.ename%type, DEPTNO emp.deptno%type,
												 HIREDATE emp.hiredate%type, SAL emp.sal%type);
	-- ��ȸ�� ���ڵ带 ������ �� �ִ� table�� ���� (���ϳ��� ��ȸ�� ���ϳ��� ����)
	type data_tab is table of emp_rec index by binary_integer;

	-- ���ϳ��� ��ȸ�� ���ϳ��� ������ �� �ִ� emp_table�� ����Ͽ� table ������ ����
	emp_data data_tab;
	-- record���� ����
	ed emp_rec;

--	EMPNO emp.empno%type;
--	ENAME emp.ename%type;
--	DEPTNO emp.deptno%type;
--	HIREDATE emp.hiredate%type;
--	SAL emp.sal%type;

	-- �ε�����
	idx number := 0;

	-- �μ��� �����
	dname varchar(30);

	-- 1. Ŀ������
	cursor cur_emp is
	select empno, ename, deptno, hiredate, sal
	from emp
	where mgr = &mgr;

begin
---------------------������ ó������---------------------------------
	-- 2. Ŀ������
	if cur_emp%isopen then
		close cur_emp;
	end if;

	open cur_emp;

	-- 3. ���� : ����� ���ڵ带 table�� �濡 ��´�.
	loop
		idx := idx+1;
		fetch cur_emp into emp_data(idx);
	  exit when(cur_emp%notfound);


	end loop;

	-- 4. Ŀ���ݱ�
	close cur_emp;
------------------------������ ó����-------------------------------

------------------------�� ó������-------------------------------
	 if idx = 1 then
	 	dbms_output.put_line(&mgr||'�Ŵ����� �����ϴ� ����� ���ų�, �Ŵ����� �ƴմϴ�.')
	 end if;

	 for i in 1 ..emp_data.count loop
			ed := emp_data(i);

	 	  if ed.deptno = 10 then
	     dname := '���ߺ�';
	  	elsif ed.deptno = 20 then
	     dname := '����������';
	  	elsif ed.deptno = 30 then
	     dname := '������';
	  	else
	  	 dname := '�������';
	  	end if;

	  dbms_output.put_line(ed.empno||','||ed.ename||','||ed.deptno||','||dname||
				','||ed.hiredate||','||ed.sal);
	  -- decode �Լ��� SQL������ ����� �� �ִ�.
	  -- �׷��Ƿ� PL/SQL������ if���� �̿��Ѵ�.

	 end loop;
------------------------�� ó����-------------------------------

exception
when invalid_cursor then
dbms_output.put_line('Ŀ���� �߸��� ������ �����Ͽ����ϴ�.');
when others then
dbms_output.put_line('�����ڰ� ������������ ���� : '||sqlerrm);

end;
/

