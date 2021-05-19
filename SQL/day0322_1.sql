 select * from emp;

 -- ������̺��� �����ȣ, �����, �μ���ȣ, �μ��� ��ȸ
 -- ��, �μ����� �Ʒ�ǥ�� ���� �ѱ۷� �� �μ����� ���
 SELECT EMPNO, ENAME, DEPTNO,
 CASE DEPTNO WHEN 10 THEN '���ߺ�'
             WHEN 20 THEN '����������'
             WHEN 30 THEN '���'
 		ELSE '�౸��'
 END H_DNAME
 FROM EMP;

 SELECT EMPNO, ENAME, DEPTNO, DECODE(DEPTNO, 10,'���ߺ�',20,'����������',30,'���') AS H_DNAME
 FROM EMP;

 -- ������̺��� �����ȣ, ����, �Ѽ��ɾ�, ���ʽ��� ��ȸ
 -- ��, ���������ʽ��� �Ʒ��� ����.
 -- CLERK - ���� 10%�� ���ʽ�  SALESMAN - ����+COMM �ջ�ݾ�20%
 -- MANAGER - ����15%���ʽ�  ANALYST - ���� 30%  PRESIDENT - ���� 150%
 SELECT EMPNO, SAL, SAL+NVL(COMM,0) AS TOTAL,
 CASE JOB WHEN 'CLERK' THEN SAL*0.1
 					WHEN 'SALESMAN' THEN SAL+NVL(COMM,0)*0.2
					WHEN 'MANAGER' THEN SAL*0.15
					WHEN 'ANALYST' THEN SAL*0.3
			ELSE SAL+(SAL*1.5)
			END COMM
 FROM EMP;

-- ORDER BY --
-- ������̺��� �����ȣ, �����, ����, �Ի��� ��ȸ
-- ��, ���帶������ �Ի��� ������� ��ȸ�� ��

SELECT EMPNO, ENAME, SAL, HIREDATE
FROM EMP
ORDER BY HIREDATE DESC;

-- �������̺��� �����ȣ, �����, ����, �Ի���, �μ���ȣ�� ��ȸ
-- ��, �μ���ȣ�� ������������ �����ϵ�, �μ���ȣ�� ���ٸ� ������ ������������ ����
-- ���� ������ ��� ������� ������������ ����
SELECT EMPNO, ENAME, SAL, HIREDATE, DEPTNO
FROM EMP
ORDER BY DEPTNO, SAL , ENAME;

-- ��� ���̺��� �����ȣ, �����, ����, ����, �μ���ȣ, �Ի����� ��ȸ
-- ��, ������ ������������ �����ϵ�, ������ ���ٸ� ������ ������������ �����ϰ�,
-- ������ ���ٸ� �Ի����� ������������ ����
SELECT EMPNO, ENAME, SAL, JOB, DEPTNO, HIREDATE
FROM EMP
ORDER BY JOB DESC, SAL, HIREDATE DESC;

-- �����Լ� --
--������̺��� �����ȣ, �����, ����, ������ ������ȸ
-- ���� ������ �߻�, ���� ���� ���Ŀ��� ������ �ǳ� �ڴ�.
SELECT EMPNO,EMPNO, SAL, RANK() OVER( ORDER BY SAL )
FROM EMP;
ORDER BY SAL DESC;

-- ���� ������ �߻����� �ʴ´�.
SELECT EMPNO,EMPNO, SAL, ROW_NUMBER() OVER( ORDER BY SAL DESC)
FROM EMP;

-- �з��� ���� ���� partition by ���
-- ������̺��� �μ����� ���� �������� ������ ��ȸ ( �ߺ������� �߻����� �ʴ´�)

select deptno, sal, row_number() over ( partition by deptno order by sal) DEPTNO_SAL
from emp;

-- ������̺��� �����ȣ, �����, �μ���ȣ, �Ŵ�����ȣ, ������ ��ȸ
-- ��, �Ŵ����� ������ ������������ ���� ��ȸ( �ߺ������� �߻����� �ʴ´�)
select EMPNO, ENAME, DEPTNO, MGR, SAL, row_number() over ( partition by MGR order by SAL ) as sal_mgr
from emp;

-- �����Լ�(�׷��Լ�) --

-- �÷����� ��� �ϳ��� ����� �Լ�
-- ��� ���̺��� ��ü ������� ��ȸ
select count(empno),  /* ,ename �������� ��ȸ�Ǵ� �÷��� ���� ���Ǹ� ���� �߻� */
from emp;

-- count�� null�� �÷��� ���ؼ��� ���迡 �������� �ʴ´�.
select count(comm), count (mgr)
from emp;

-- ������̺��� ��ü�����, ���ʽ��� �޴� �����, ���ʽ��� ���� �ʴ»���� ��ȸ
select count(EMPNO), count(COMM), count(EMPNO) - count(COMM)
from emp;

-- ������̺��� 1�⿡ ������ ����Ǵ� �Ѿ��� ��ȸ
/*sum(hiredate) */
select sum(sal) ,sum(comm), sum(sal) - sum(comm)
from emp;

-- avg()�� �����÷��� ���� �� �ִ�.
-- ������̺��� �������, �Ǽ��� ������ �������, ���ʽ� ����� ��ȸ

select avg(sal), trunc(avg(sal), 0), avg(comm)
from emp;

-- max(), min() �����÷��� ���� �� �ִ�.
-- ������̺��� ������ �ְ� ��, ������ �������� ��ȸ
select max( sal ), min( sal )
from emp;

-----------
--������̺��� ��տ������� ���� �޴� ����� �����ȣ, �����, �Ի���, ������ ��ȸ
select EMPNO, ENAME, HIREDATE, SAL
from emp;

-- distubct�� ����� �ߺ�����
-- ������̺��� �μ���ȣ�� ��ȸ
-- ��, ���� �μ���ȣ�� ��ȸ���� �ʴ´�.
-- �������� ��ȸ�Ǵ� �÷��� ���� ���Ǵ��� ������ �߻����� �ʴ´�.

select distinct DEPTNO
from emp
order by deptno;

-- group by�� ����� �ߺ�����
-- �������� ��ȸ�Ǵ� �÷��� ���� ���Ǹ� ������ �߻��Ѵ�.
select deptno
from emp
group by deptno;

-- ������̺��� ������� 3���� �ʰ��ϴ� �μ��� �μ���ȣ, ������� ��ȸ
select deptno, count(deptno)
from emp
group by deptno
having count(deptno) > 3; -- having���� �����Լ� ��� ����











