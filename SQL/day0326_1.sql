-- join --
-- �����ȣ, �����, �Ի���, �μ���ȣ, �μ���, ��ġ ��ȸ
-- ANSI

-- ���� ���̺� �����ϴ� �÷��� �÷������� ����� �� ���̺��.�÷����� ���
-- �÷��� � ���̺� �����ϴ� �� �˱� ��ƴ�.
select EMPNO, ENAME, HIREDATE, emp.DEPTNO, DNAME, LOC
from dept
inner join emp
on emp.deptno = dept.deptno;

-- �÷��� � ���̺� �����ϴ��� �� �� �ֵ��� �÷��� �տ� ���̺����
-- ����Ͽ� ����� �� �ִ�.
-- ��ȸ�÷��� �ۼ��ϴ� �ڵ����� �þ��(����)
select emp.EMPNO, emp.ENAME, emp.HIREDATE, emp.DEPTNO, dept.DNAME, dept.LOC
from dept
inner join emp
on emp.deptno = dept.deptno;

-- ���̺�� alias�� �ο��Ͽ� �÷��� ���� ���̺��� ����ϰ�, ª�� �ڵ��
-- ����� �� �ְԵȴ�.
-- ���̺�� alias �ο� : ���̺�� alias

-- ANSI
select e.EMPNO, e.ENAME, e.HIREDATE, e.DEPTNO, d.DNAME, d.LOC
from dept d
inner join emp e
on e.deptno = d.deptno;

-- Oracle
select e.EMPNO, e.ENAME, e.HIREDATE, e.DEPTNO, d.DNAME, d.LOC
from dept d, emp e
where e.deptno = d.deptno;

-- ������ 1000�̻� 3000������ �������
-- �����ȣ, �����, �Ի���, �μ���ȣ, �μ���, ��ġ�� ��ȸ
-- ANSI
select e.EMPNO, e.ENAME, e.sal, e.HIREDATE, d.DEPTNO, d.DNAME, d.LOC
from emp e
inner join dept d
on e.deptno = d.deptno
where e.sal between 1000 and 3000
order by e.sal;

-- Oracle
select e.EMPNO, e.ENAME, e.sal, e.HIREDATE, d.DEPTNO, d.DNAME, d.LOC
from emp e, dept d
where (e.deptno = d.deptno) and e.sal between 1000 and 3000
order by e.sal;

-- �������� �������� ��ⷮ�� 1600�̻� 3000������
-- ��� ������ ������, �𵨸�, ���, ��ⷮ, ������ ��ȸ
-- ANSI
select MAKER, k.MODEL, CAR_YEAR, CC, PRICE
from car_maker k
inner join CAR_MODEL d
on k.model = d.model
where d.cc between 1600 and 3000
order by d.cc;

-- Oracle
select k.MAKER, k.MODEL, d.CAR_YEAR, d.CC, d.PRICE
from CAR_MAKER k, CAR_MODEL d
where (k.model = d.model) and d.cc between 1600 and 3000
order by d.cc;

-- ���̺� 3������
-- �����ȣ, �����, ����, �μ���ȣ, �μ���, ��ġ, �����ȣ, �õ�, ����, ��
-- ������̺��� �����ȣ�� �����ȣ���̺��� seq�� ������������ ���
select * from ZIPCODE;

-- ANSI
select e.empno, e.ename, e.sal, d.deptno, d.dname, d.loc,
			 z.zipcode, z.sido, z.gugun, z.dong
from dept d
inner join emp e
on e.deptno = d.deptno
inner join zipcode z
on z.seq = e.empno;

-- Oracle
select e.empno, e.ename, e.sal, d.deptno, d.dname, d.loc,
			 z.zipcode, z.sido, z.gugun, z.dong
from dept d, emp e, zipcode z
where ( e.deptno = d.deptno and z.seq = e.empno );


