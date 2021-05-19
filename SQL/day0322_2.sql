select * from emp;
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

-- group by�� �����Լ��� ����ϸ� �׷캰 ���踦 ���� �� �ִ�.
-- ������̺��� �μ��� �ο���, �ְ� ����, ��������, ��տ����� ��ȸ

select deptno, count(empno), max(sal), min(sal), trunc(avg(sal),0)
from emp
group by deptno
order by deptno;

-- ������̺��� �Ŵ����� �����ϴ� ����� 2�� �̻��� �Ŵ�����
-- ������� ��, ��տ���, ��������, �ְ����� ��ȸ
-- �Ŵ�����ȣ�� ������������ �����Ͽ� ��ȸ
select MGR, count(EMPNO), trunc(avg(SAL)), min(SAL), max(SAL)
from emp
group by MGR
having count(MGR) > 1
order by MGR desc;

-- �׷캰 ���� ���
-- ������̺��� �μ��� �����հ� ������ ��ȸ
-- rollup : �׷캰 �հ踦 ����ϰ�, ������ ���߿� ����Ѵ�.
select deptno, sum(sal)
from  emp
group by rollup (deptno);
-- cube : ������ ���� ����ϰ�, �׷캰 �հ踦 ����Ѵ�.
select deptno, sum(sal)
from  emp
group by cube (deptno);

-- �Ұ�, ���հ踦 ��ȸ�� ��
-- ������̺��� �μ��� ������ ��, �Ұ�� ������ ��ȸ
select deptno,job, sum(sal)
from emp
group by cube(deptno, job);

select deptno,job, sum(sal)
from emp
group by rollup(deptno, job);

-- ������̺� �Ŵ����� �μ��� �����հ� �Ұ�, ������ cube, rollup�� ����Ͽ� ������ȸ
select MGR,DEPTNO,SUM(SAL)
from emp
group by cube(MGR, DEPTNO);

select MGR,DEPTNO,SUM(SAL)
from emp
group by rollup(MGR, DEPTNO);








