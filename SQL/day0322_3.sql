-- create subquery --
-- ���̺� ������ �� ��� (��ȸ�� ����� ����Ͽ� ���̺��� ���� �� ��)
-- ��õ �����Ϳ��� �ʿ��� �����͸� �����Ͽ� ������ ��

-- ������̺��� �μ���ȣ�� 10�� 30���� �μ������ �����ȣ, �����, �μ���ȣ,
-- ����, ������ ��ȸ�ϰ� cp_emp1���̺��� �����Ͽ� �߰��ϼ���.
CREATE TABLE cp_emp1 as
(select EMPNO, ENAME, DEPTNO, JOB, SAL
from emp
--where DEPTNO = 10 OR DEPTNO = 20;
WHERE  DEPTNO IN(10,20));

select * from cp_emp1;

drop table cp_emp1;




-- DBMS���� ��ϱ� ���� ������ �����ϴ� ���̺��� Data Dictionary��� �Ѵ�.
-- DD�� ����ڰ� ���� insert, update, delete�� �� �� ����, �۾��ϴ� ������ ����
-- �ڵ����� insert, update, delete�� ����ȴ�.
-- DD�� ����ڰ� select�� �����ϴ�.
-- ��������� Ȯ���� �� �ִ� DD�� user_constraints �̴�.
select * from user_constraints
where table_name = 'EMP';

-- cp_emp1 table�� �÷���, ��������, ũ��, ���ڵ�� emp���� �״�� ���� �Ǿ�����
-- ��������� ������� �ʴ´�.
select * from user_constraints;

-- ������̺��� �����ȣ, �����, ����, ����, �Ŵ�����ȣ, �Ի����� ��ȸ�Ͽ�
-- ������ inline view�� ����Ͽ� cp_emp2 ���̺��� �����ϼ���.
create table cp_emp2 as
(select EMPNO , ENAME, JOB, SAL, MGR, HIREDATE
from emp );

select * from CP_EMP2;

-- ������̺��� �����ȣ, �����, ����, �Ŵ�����ȣ, �Ի���, ������ �÷���, ��������
-- ũ�⸦ �״�� ���� cp_emp3 ���̺��� �����غ����� ( ���ڵ� ���� ���̺��� ������ ���� )
-- ���ڵ尡 �˻����� �ʵ��� SELECT�� �ۼ�...
create table cp_emp3 as(
select EMPNO, ENAME, JOB, MGR, HIREDATE, SAL
from EMP
WHERE 1=0);
--where 1=1; -> �׻� true
--where 1=0; -> �׻� false

drop table cp_emp3;

select * from CP_EMP3;

-- insert subquery --
-- �ܼ��� : �ٸ��÷��� ���� ����Ͽ� ���ڵ带 �߰��� ��
-- cp_emp1���̺� �Ʒ��� ���� ��������� �߰�
-- �����ȣ : 1212, ����� : �ѻ��, �μ���ȣ : 15��
-- job(����) : �븮 ���� : emp���̺��� ��� ��ȣ�� 7788��
-- ����� ������ ����.
insert into cp_emp1(EMPNO, ENAME, DEPTNO, JOB, SAL)
values(1212,'�ѻ��', 15, '�븮',
( select sal from emp where EMPNO = 7788 ));

commit;

select * from CP_EMP1;

-- cp_emp1���̺� �Ʒ��� ���� ��������� �߰�
-- �����ȣ : 1213, ����� : ���й�, �μ���ȣ : emp���̺��� �����ȣ��
-- 7369�� ����� ������ �μ���ȣ�� �߰�,
-- job(����) : emp���̺��� ������� JONES�� ����� ���ް� ������ ������,
-- ���� : emp���̺��� ��� ��ȣ�� 7521�� ����� �������� 100 ���� �������� �߰�
insert into cp_emp1(EMPNO, ENAME, DEPTNO, JOB, SAL)
VALUES(1213,'���й�',
(SELECT DEPTNO FROM EMP WHERE DEPTNO = 7369),
(SELECT JOB FROM EMP WHERE ENAME = 'JONES'),
(SELECT SAL+100 FROM EMP WHERE EMPNO = 7521));





