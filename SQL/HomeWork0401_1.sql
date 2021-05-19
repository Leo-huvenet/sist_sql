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
	data data_tab;

	EMPNO emp.empno%type;
	ENAME emp.ename%type;
	DEPTNO emp.deptno%type;
	HIREDATE emp.hiredate%type;
	SAL emp.sal%type;

	-- ��ȸ�� ���� ���� �����ϱ����� ����
	cnt number := 1;
  str varchar2(500) ;
	-- 1. Ŀ������
	cursor cur_emp is
	select empno, ename, deptno, hiredate, sal
	from emp
	where mgr = &mgr;

begin
	-- 2. Ŀ������
	if cur_emp%isopen then
		close cur_emp;
	end if;

	open cur_emp;

	-- 3. ���� : ����� ���ڵ带 table�� �濡 ��´�.
	loop
    fetch cur_emp into empno, ename, deptno, hiredate, sal;

		exit when(cur_emp%notfound);

		str := (empno||','||ename||','||deptno||','||hiredate||','||sal);

    data(cnt).empno := substr(str,1,instr(str,',',1,1)-1);
		data(cnt).ename := substr(str,instr(str,',',1,1)+1,instr(str,',',1,2)-instr(str,',',1,1)-1);
		data(cnt).deptno := substr(str,instr(str,',',1,2)+1,instr(str,',',1,3)-instr(str,',',1,2)-1);
		data(cnt).hiredate := substr(str,instr(str,',',1,3)+1,instr(str,',',1,4)-instr(str,',',1,3)-1);
		data(cnt).sal := substr(str,instr(str,',',1,4)+1);

	   cnt := cnt + 1;

	end loop;

	dbms_output.put_line(data.count||'��');

	for i in 1..data.count loop
		if data(i).deptno = 10 then
		dbms_output.put_line(data(i).empno||', '||data(i).ename||', ���ߺ�, '||
												 data(i).hiredate||', '||data(i).sal);
		elsif data(i).deptno = 20 then
		dbms_output.put_line(data(i).empno||', '||data(i).ename||', ����������, '||
												 data(i).hiredate||', '||data(i).sal);
		elsif data(i).deptno = 30 then
		dbms_output.put_line(data(i).empno||', '||data(i).ename||', ������, '||
												 data(i).hiredate||', '||data(i).sal);
	  else
		dbms_output.put_line(data(i).empno||', '||data(i).ename||', ���������, '||
												 data(i).hiredate||', '||data(i).sal);
	  end if;

	end loop;

  close cur_emp;

end;
/
