-- outer join (한쪽테이블에만 레코드가 존재하더라도 조회가능)
-- 존재하는 모든 부서의 부서번호, 부서명, 위치, 사원번호, 사원명을 조회

-- ANSI
select d.deptno, d.dname, d.loc, e.empno, e.ename
from dept d
left outer join emp e
on e.deptno = d.deptno;

-- Oracle outer join
-- (+)기호를 레코드가 없는 컬럼에 붙인다.
select d.deptno, d.dname, d.loc, e.empno, e.ename
from dept d, emp e
where ( e.deptno(+) = d.deptno );

-- 레코드가 존재하지 않는 테이블을 선택하면 조회결과가 나오지 않는다.
select d.deptno, d.dname, d.loc, e.empno, e.ename
from dept d
right outer join emp e
on e.deptno = d.deptno;

-- Oracle outer join
-- 레코드가 존재하는 컬럼에 (+) 기호를 붙이면 inner join과 같다.
select d.deptno, d.dname, d.loc, e.empno, e.ename
from dept d, emp e
where (e.deptno = d.deptno(+));

-- 레코드의 구성을 잘 모르지만 모든 레코드를 조회해야한다면 full outer join
-- outer는 생략가능하다
select d.deptno, d.dname, d.loc, e.empno, e.ename
from dept d
full outer join emp e
on e.deptno = d.deptno;

-- Oracle outer join
-- (+) 기호는 양쪽에 붙일 수 없다.
select d.deptno, d.dname, d.loc, e.empno, e.ename
from dept d, emp e
where (e.deptno(+) = d.deptno(+));

-- 모든 부서에 근무하는 사원들의 부서번호, 부서명, 위치, 사원번호, 사원명,
-- 우편번호, 시도, 구군, 동, 번지를 조회
-- 단, 부서에 근무하는 사원이 존재하지 않으면 사원번호에 '0'번을
-- 사원명 '없음'을 대신 조회한다.

-- ANSI : 례코드가 있는 쪽
select d.deptno, d.dname, d.loc,
			 nvl(e.empno, 0) empno, nvl(e.ename, '없음') ename,
			 z.zipcode, z.sido, z.gugun, z.dong, z.bunji
from dept d
left join emp e
on e.deptno = d.deptno
left join zipcode z
on z.seq = e.empno;

-- Oracle : 레코드가 없는 쪽
select d.deptno, d.dname, d.loc,
			 nvl(e.empno, 0) empno, nvl(e.ename, '없음') ename,
			 z.zipcode, z.sido, z.gugun, z.dong, z.bunji
from dept d, emp e, zipcode z
where (e.deptno(+) = d.deptno and z.seq(+) = e.empno);

------------------------------------------------
select * from EMP;
-- 사원 테이블에서 사원명이 'WARD'인 사원보다 연봉을 많이 수령하는 사원의
-- 사원번호, 사원명, 연봉, 직무, 일사일 조회
select EMPNO, ENAME, SAL, JOB, HIREDATE
from emp
where sal > (select SAL from EMP where ENAME = 'WARD');

-- self join : 조회용 테이블과 조건용 테이블을 잘 구분하여 사용할 것
select e1.empno, e1.ename, e1.sal, e1.job, e1.hiredate
from emp e1, emp e2
where (e1.sal > e2.sal) and e2.ename = 'WARD';

-- 조인조건을 잘 못 설정하면 모든 레코드의 합이 조회되어 나오는 Cartesian Product이 발생할 수 있다.
select e.empno, e.ename, d.deptno, d.dname
from dept d, emp e ;


