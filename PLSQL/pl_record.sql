-- �����ȣ, �����, ����, �Ի����� ������ �� �ִ� record����, ����ϴ� ����.

set serveroutput on

declare
	--1.record ���� : type ���ڵ�� is recored (���ڵ忡 ���Ե� ����,,,,);
	 type emp_rec is record(empno number(4), ename emp.ename%type, job varchar2(30),
	 			hiredate date);
	--2. ����� record�� ����Ͽ� ���� ���� : ������ record��
	kang emp_rec;

begin
	--3. ����� record������ ���
	-- ���Ҵ� : ���ڵ庯����.���ڵ�ȿ� ���ǵ� ������ := ��;
	kang.empno := 1111;
	kang.ename := '���μ�';
	kang.job := '������';
	kang.hiredate := sysdate;

	-- �� ���
	dbms_output.put_line('����� : '||kang.ename||', �����ȣ : '|| kang.empno
			||'. ���� : '||kang.job||'. �Ի��� : '||
			to_char(kang.hiredate, 'yyyy-mm-dd'));

end;
/
