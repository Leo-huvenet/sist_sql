-- rollback����

create table test1(
	name varchar2(15),
	age number(3)
	);

insert into test1(name,age) values('�����',26);

select *
from test1;
commit;

insert into test1(name,age) values('���й�',38);

update test1
set age=26
where name = '���й�';

rollback;

-- savepoint ��� --
savepoint insert_a;
insert into test1(name,age) values('������',300);

savepoint update_b;
update test1
set age = 30
where name = '������';

savepoint delete_c;
delete from test1
where name = '������';

select *
from test1;

--rollback to update_b;

--rollback to insert_a;

--rollback to delete_c;

-- select --
-- ��� ���̺��� �����ȣ, �����, ����, ���ʽ�, �Ѽ��ɾ��� ��ȸ
-- ��, �� ���ɾ��� ������ ���ʽ��� �ջ��� �ݾ�
select EMPNO, ENAME, SAL, COMM, SAL+COMM as TotalSal
from EMP ;

-- alias --
-- �÷��� alias, �÷��� as alias
-- ��ҹ��� �����ϴ� �÷��� ���. �÷��� "alias"
-- ���� �÷��� ������ ��ȸ�ϸ�, alias�� �ڵ� �����ǿ� �ο��ȴ�.
select DEPTNO d_no, DNAME as dn, LOC "LoC", LOC ��ġ, LOC "L oc"
from DEPT ;

-- �÷����� alias�� where ������ ����� �� ����.
select DEPTNO d_no, DNAME
from DEPT
where deptno = 10;

-- �μ����̺��� �μ���ȣ, �μ���, ��ġ ��ȸ
-- ��, �μ���ȣ�� ����μ���ȣ���� -3�� ������ ������ ��ȸ
select DEPTNO,DEPTNO-3 new_deptno, DNAME, LOC
from DEPT;

-- ��������ڰ� �ƴ� �ٸ� �����ڴ� ��ȸ�ϴ� �÷Ÿ� ����� �� ����.
-- select empno > 10
-- from emp;

-- ���������� ���
-- ������̺��� ����� '��'�� �ٿ� ��ȸ
select ename||'��', '��'||ename, empno||ename
from emp;

-- ������̺��� �����ȣ, �����, ������ ��ȸ
-- ��, ��ȸ������ �����(�����ȣ)���� ������ XXX$�Դϴ�. �� ��ȸ�ϰ�
-- �÷����� output���� ������ ��
select ENAME||'('||EMPNO||')���� ������'|| SAL||'$�Դϴ�.'as output
from emp;

-- ������̺��� �����ȣ, �����, ����, ����, ������ ��ȸ
-- ��, ������ �������� 3.3�� ����Ͽ� ����� ��.
-- ���ݰ���� �÷����� alias ���
select EMPNO, ENAME, JOB, SAL, SAL*3.3*0.01 AS TAX
from emp;

-- ������̺��� �����ȣ, �����ȣ���, ����� ��ȸ
-- ��, �����ȣ����� ¦���� 0�� Ȧ���� 1�� ��ȸ�� ��
select EMPNO, mod(EMPNO,2) EMPNO_result ,ENAME
from emp;


