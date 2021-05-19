-- join --
-- 사원번호, 사원명, 입사일, 부서번호, 부서명, 위치 조회
-- ANSI

-- 양쪽 테이블에 존재하는 컬럼은 컬럼명으로 사용할 때 테이블명.컬러명을 사용
-- 컬럼이 어떤 테이블에 존재하는 지 알기 어렵다.
select EMPNO, ENAME, HIREDATE, emp.DEPTNO, DNAME, LOC
from dept
inner join emp
on emp.deptno = dept.deptno;

-- 컬럼이 어떤 테이블에 존재하는지 알 수 있도록 컬럼명 앞에 테이블명을
-- 명시하여 사용할 수 있다.
-- 조회컬럼이 작성하는 코딩량이 늘어난다(복잡)
select emp.EMPNO, emp.ENAME, emp.HIREDATE, emp.DEPTNO, dept.DNAME, dept.LOC
from dept
inner join emp
on emp.deptno = dept.deptno;

-- 테이블명에 alias를 부여하여 컬럼이 속한 테이블을 명시하고, 짧은 코드로
-- 사용할 수 있게된다.
-- 테이블명에 alias 부여 : 테이블명 alias

-- ANSI
select e.EMPNO, e.ENAME, e.HIREDATE, e.DEPTNO, d.DNAME, d.LOC
from dept d
inner join emp e
on e.deptno = d.deptno;

-- Oracle
select e.EMPNO, e.ENAME, e.HIREDATE, e.DEPTNO, d.DNAME, d.LOC
from dept d, emp e
where e.deptno = d.deptno;

-- 연봉이 1000이상 3000이하인 사원들의
-- 사원번호, 사원명, 입사일, 부서번호, 부서명, 위치를 조회
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

-- 보유중인 차량에서 배기량이 1600이상 3000이하인
-- 모든 차량의 제조사, 모델명, 년식, 배기량, 가격을 조회
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

-- 테이블 3개조인
-- 사원번호, 사원명, 연봉, 부서번호, 부서명, 위치, 우편번호, 시도, 구군, 동
-- 사원테이블의 사원번호와 우편번호테이블의 seq를 조인조건으로 사용
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


