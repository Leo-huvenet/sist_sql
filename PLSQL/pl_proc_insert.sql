-- �����ȣ, �����, �μ���ȣ, ������ �Է¹޾� CP_EMP4���̺� ���ڵ带 �����ϴ�
-- Procedure ����

create or replace procedure proc_insert(empno cp_emp4.empno%type,
	 ename cp_emp4.ename%type, deptno cp_emp4.deptno%type, job cp_emp4.job%type,
	 row_cnt out number, msg out varchar)
	 is


	 begin

	 insert into cp_emp4(empno, ename, deptno, job, hiredate)
	 values( empno, ename, deptno, job, sysdate );

	 --insert �� ���� ��
	 row_cnt := sql%rowcount;

	 if row_cnt = 1 then
			msg := empno||'�� ��� ������ �߰��Ǿ����ϴ�.';
	 		commit;
	 end if;

	 exception
	 when dup_val_on_index then
	    msg := empno||'�� �����ȣ�� ������Դϴ�.';
	 when others then
	 		msg := '������� �߰� �۾� �� �����߻�';

	 end;

