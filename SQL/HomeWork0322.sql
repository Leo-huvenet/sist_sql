select * from EMP;

--����1
SELECT EMPNO||'�� '||ENAME||'����� �Ի����� '||to_char(HIREDATE,'yyyy-mm-dd dy"����"')||'�Դϴ�. ������'||SAL||'$ �Դϴ�.'
FROM EMP
WHERE to_char(HIREDATE,'dy') in('��','ȭ','��');

--����2
select * from DEPT;

select DEPTNO, DNAME
from dept
where LOC = 'DALLAS';

--����3
select JOB, count(EMPNO), sum(SAL)
from emp
group by rollup(job);

--����4
select DEPTNO||'�� �μ� ������� ['||COUNT(empno)||'], ������� : ['||trunc(avg(SAL),0)||'],'||
 '�ְ��� ['||max(SAL)||'], �������� ['||MIN(SAL)||']'
from emp
where to_char(HIREDATE,'q') in(3,4)
group by deptno
ORDER BY DEPTNO;




