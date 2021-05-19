-- outer join (�������̺��� ���ڵ尡 �����ϴ��� ��ȸ����)
-- �����ϴ� ��� �μ��� �μ���ȣ, �μ���, ��ġ, �����ȣ, ������� ��ȸ

-- ANSI
select d.deptno, d.dname, d.loc, e.empno, e.ename
from dept d
left outer join emp e
on e.deptno = d.deptno;

-- Oracle outer join
-- (+)��ȣ�� ���ڵ尡 ���� �÷��� ���δ�.
select d.deptno, d.dname, d.loc, e.empno, e.ename
from dept d, emp e
where ( e.deptno(+) = d.deptno );

-- ���ڵ尡 �������� �ʴ� ���̺��� �����ϸ� ��ȸ����� ������ �ʴ´�.
select d.deptno, d.dname, d.loc, e.empno, e.ename
from dept d
right outer join emp e
on e.deptno = d.deptno;

-- Oracle outer join
-- ���ڵ尡 �����ϴ� �÷��� (+) ��ȣ�� ���̸� inner join�� ����.
select d.deptno, d.dname, d.loc, e.empno, e.ename
from dept d, emp e
where (e.deptno = d.deptno(+));

-- ���ڵ��� ������ �� ������ ��� ���ڵ带 ��ȸ�ؾ��Ѵٸ� full outer join
-- outer�� ���������ϴ�
select d.deptno, d.dname, d.loc, e.empno, e.ename
from dept d
full outer join emp e
on e.deptno = d.deptno;

-- Oracle outer join
-- (+) ��ȣ�� ���ʿ� ���� �� ����.
select d.deptno, d.dname, d.loc, e.empno, e.ename
from dept d, emp e
where (e.deptno(+) = d.deptno(+));

-- ��� �μ��� �ٹ��ϴ� ������� �μ���ȣ, �μ���, ��ġ, �����ȣ, �����,
-- �����ȣ, �õ�, ����, ��, ������ ��ȸ
-- ��, �μ��� �ٹ��ϴ� ����� �������� ������ �����ȣ�� '0'����
-- ����� '����'�� ��� ��ȸ�Ѵ�.

-- ANSI : ���ڵ尡 �ִ� ��
select d.deptno, d.dname, d.loc,
			 nvl(e.empno, 0) empno, nvl(e.ename, '����') ename,
			 z.zipcode, z.sido, z.gugun, z.dong, z.bunji
from dept d
left join emp e
on e.deptno = d.deptno
left join zipcode z
on z.seq = e.empno;

-- Oracle : ���ڵ尡 ���� ��
select d.deptno, d.dname, d.loc,
			 nvl(e.empno, 0) empno, nvl(e.ename, '����') ename,
			 z.zipcode, z.sido, z.gugun, z.dong, z.bunji
from dept d, emp e, zipcode z
where (e.deptno(+) = d.deptno and z.seq(+) = e.empno);

------------------------------------------------
select * from EMP;
-- ��� ���̺��� ������� 'WARD'�� ������� ������ ���� �����ϴ� �����
-- �����ȣ, �����, ����, ����, �ϻ��� ��ȸ
select EMPNO, ENAME, SAL, JOB, HIREDATE
from emp
where sal > (select SAL from EMP where ENAME = 'WARD');

-- self join : ��ȸ�� ���̺�� ���ǿ� ���̺��� �� �����Ͽ� ����� ��
select e1.empno, e1.ename, e1.sal, e1.job, e1.hiredate
from emp e1, emp e2
where (e1.sal > e2.sal) and e2.ename = 'WARD';

-- ���������� �� �� �����ϸ� ��� ���ڵ��� ���� ��ȸ�Ǿ� ������ Cartesian Product�� �߻��� �� �ִ�.
select e.empno, e.ename, d.deptno, d.dname
from dept d, emp e ;


