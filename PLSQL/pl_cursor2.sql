-- �μ���ȣ �Է¹޾� CP_EMP1 ���̺��� ��������� ��ȸ
-- ��ȸ �����ȣ, �����, ����, ������ ��ȸ
set serveroutput on
set verify off

accept deptno prompt '�μ���ȣ : '

declare

	empno cp_emp1.empno%type;
  ename cp_emp1.ename%type;
  job cp_emp1.job%type;
  sal cp_emp1.sal%type;

--1. Ŀ������
  cursor cur_emp is
		select empno, ename, job, sal from cp_emp1
  	where deptno = &deptno;

  	cnt number := 0;

begin
--2. ����
	if cur_emp%isopen then
		close cur_emp;
	end if;

	open cur_emp;

--3. ����
	loop
		fetch cur_emp into empno, ename, job, sal;

		exit when( cur_emp%notfound );

		dbms_output.put_line(empno||' / '||ename||' / '||job||' / '||sal);
		-- ������ �ѹ��̶� �ȴٸ� cnt������ ������Ų��.
		cnt := cnt+1;
	end loop;
	
	dbms_output.put_line('��ȸ�� ��� : '||cur_emp%rowcount);

-- 4. �ݱ�
	close cur_emp;

  if cnt = 0 then
   dbms_output.put_line(&deptno||'�� �μ��� ����� �������� �ʽ��ϴ�.');
  end if;
  
end;
/
