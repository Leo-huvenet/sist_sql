select * from EMP;

--숙제1
SELECT EMPNO||'번 '||ENAME||'사원의 입사일은 '||to_char(HIREDATE,'yyyy-mm-dd dy"요일"')||'입니다. 연봉은'||SAL||'$ 입니다.'
FROM EMP
WHERE to_char(HIREDATE,'dy') in('월','화','목');

--숙제2
select * from DEPT;

select DEPTNO, DNAME
from dept
where LOC = 'DALLAS';

--숙제3
select JOB, count(EMPNO), sum(SAL)
from emp
group by rollup(job);

--숙제4
select DEPTNO||'번 부서 사원수는 ['||COUNT(empno)||'], 연봉평균 : ['||trunc(avg(SAL),0)||'],'||
 '최고연봉 ['||max(SAL)||'], 최저연봉 ['||MIN(SAL)||']'
from emp
where to_char(HIREDATE,'q') in(3,4)
group by deptno
ORDER BY DEPTNO;




