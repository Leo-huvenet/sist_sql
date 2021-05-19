-- �����ȣ�� �Է¹޾� CP_EMP1���̺��� ��������� ��ȸ�ϴ� PL/SQL
-- ��ȸ�÷��� �����, �μ���ȣ, ����, ������ ��ȸ�Ͽ� ���
set serveroutput on
set verify off

accept empno prompt '�����ȣ : '

declare
	i_empno cp_emp1.empno%type := &empno;
	-- into������ ����� ����
	ename cp_emp1.ename%type;
	deptno cp_emp1.deptno%type;
  job cp_emp1.job%type;
  sal cp_emp1.sal%type;
  -- �Ͻ���Ŀ���� ������ �ִ� ��
  row_cnt number;

begin

	select ENAME, DEPTNO, JOB, SAL -- ��ȸ�� ����� ���� �÷���
	into   ENAME, DEPTNO, JOB, SAL -- ������ �ִ´�(������ ������ ���� ���� ����)
	from   CP_EMP1
	where  empno = i_empno;

	row_cnt := sql%rowcount;

	dbms_output.put_line(row_cnt||'����ȸ');

	dbms_output.put_line( i_empno|| '�� ���������ȸ');
	dbms_output.put_line('����� : '|| ename||', �μ���ȣ : '||deptno||', ���� : '||
			job||', ���� : '||sal);

		exception
		when no_data_found then
			dbms_output.put_line(i_empno|| '�� ����� �������� �ʽ��ϴ�.');
      dbms_output.put_line('�����ڵ� : '||sqlcode||', �޽��� : '||sqlerrm);
		when too_many_rows then
      dbms_output.put_line(i_empno|| '�� ������� �������� �˻��Ǿ����ϴ�.');
      dbms_output.put_line('�����ڵ� : '||sqlcode||', �޽��� : '||sqlerrm);
end;
/

