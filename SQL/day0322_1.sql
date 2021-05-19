 select * from emp;

 -- 사원테이블에서 사원번호, 사원명, 부서번호, 부서명 조회
 -- 단, 부서명은 아래표와 같이 한글로 된 부서명을 출력
 SELECT EMPNO, ENAME, DEPTNO,
 CASE DEPTNO WHEN 10 THEN '개발부'
             WHEN 20 THEN '유지보수부'
             WHEN 30 THEN '운영부'
 		ELSE '축구부'
 END H_DNAME
 FROM EMP;

 SELECT EMPNO, ENAME, DEPTNO, DECODE(DEPTNO, 10,'개발부',20,'유지보수부',30,'운영부') AS H_DNAME
 FROM EMP;

 -- 사원테이블에서 사원번호, 연봉, 총수령액, 보너스를 조회
 -- 단, 직무별보너스는 아래와 같다.
 -- CLERK - 연봉 10%의 보너스  SALESMAN - 연봉+COMM 합산금액20%
 -- MANAGER - 연봉15%보너스  ANALYST - 연봉 30%  PRESIDENT - 연봉 150%
 SELECT EMPNO, SAL, SAL+NVL(COMM,0) AS TOTAL,
 CASE JOB WHEN 'CLERK' THEN SAL*0.1
 					WHEN 'SALESMAN' THEN SAL+NVL(COMM,0)*0.2
					WHEN 'MANAGER' THEN SAL*0.15
					WHEN 'ANALYST' THEN SAL*0.3
			ELSE SAL+(SAL*1.5)
			END COMM
 FROM EMP;

-- ORDER BY --
-- 사원테이블에서 사원번호, 사원명, 연봉, 입사일 조회
-- 단, 가장마지막에 입사한 사원부터 조회될 것

SELECT EMPNO, ENAME, SAL, HIREDATE
FROM EMP
ORDER BY HIREDATE DESC;

-- 서원테이블에서 사원번호, 사원명, 연봉, 입사일, 부서번호를 조회
-- 단, 부서번호의 오름차순으로 정렬하되, 부서번호가 같다면 연봉의 오름차순으로 정렬
-- 동일 연봉인 경우 사원명의 오름차순으로 정렬
SELECT EMPNO, ENAME, SAL, HIREDATE, DEPTNO
FROM EMP
ORDER BY DEPTNO, SAL , ENAME;

-- 사원 테이블에서 사원번호, 사원명, 연봉, 직무, 부서번호, 입사일을 조회
-- 단, 직무의 내림차순으로 정렬하되, 직무가 같다면 연봉의 오름차순으로 정렬하고,
-- 연봉이 같다면 입사일의 내림차순으로 정렬
SELECT EMPNO, ENAME, SAL, JOB, DEPTNO, HIREDATE
FROM EMP
ORDER BY JOB DESC, SAL, HIREDATE DESC;

-- 순위함수 --
--사원테이블에서 사원번호, 사원명, 연봉, 연봉의 순위조회
-- 동일 순위가 발생, 동일 순위 이후에는 순위가 건너 뛴다.
SELECT EMPNO,EMPNO, SAL, RANK() OVER( ORDER BY SAL )
FROM EMP;
ORDER BY SAL DESC;

-- 동일 순위가 발생하지 않는다.
SELECT EMPNO,EMPNO, SAL, ROW_NUMBER() OVER( ORDER BY SAL DESC)
FROM EMP;

-- 분류별 순위 설정 partition by 사용
-- 사원테이블에서 부서별로 낮은 연봉부터 순위를 조회 ( 중복순위는 발생하지 않는다)

select deptno, sal, row_number() over ( partition by deptno order by sal) DEPTNO_SAL
from emp;

-- 사원테이블에서 사원번호, 사원명, 부서번호, 매니저번호, 연봉을 조회
-- 단, 매니저별 연봉의 높은연봉부터 순위 조회( 중복순위는 발생하지 않는다)
select EMPNO, ENAME, DEPTNO, MGR, SAL, row_number() over ( partition by MGR order by SAL ) as sal_mgr
from emp;

-- 집계함수(그룹함수) --

-- 컬럼값을 모아 하나로 만드는 함수
-- 사원 테이블에서 전체 사원수를 조회
select count(empno),  /* ,ename 여러행이 조회되는 컬럼과 같이 사용되면 에러 발생 */
from emp;

-- count는 null인 컬럼에 대해서는 집계에 포함하지 않는다.
select count(comm), count (mgr)
from emp;

-- 사원테이블에서 전체사원수, 보너스를 받는 사원수, 보너스를 받지 않는사원수 조회
select count(EMPNO), count(COMM), count(EMPNO) - count(COMM)
from emp;

-- 사원테이블에서 1년에 연봉을 지출되는 총액을 조회
/*sum(hiredate) */
select sum(sal) ,sum(comm), sum(sal) - sum(comm)
from emp;

-- avg()는 숫자컬럼만 넣을 수 있다.
-- 사원테이블에서 연봉평균, 실수를 제외한 연봉평균, 보너스 평균을 조회

select avg(sal), trunc(avg(sal), 0), avg(comm)
from emp;

-- max(), min() 숫자컬럼만 넣을 수 있다.
-- 사원테이블에서 연봉의 최고 값, 연봉의 최저값을 조회
select max( sal ), min( sal )
from emp;

-----------
--사원테이블에서 평균연봉보다 많이 받는 사원의 사원번호, 사원명, 입사일, 연봉을 조회
select EMPNO, ENAME, HIREDATE, SAL
from emp;

-- distubct를 사용한 중복배제
-- 사원테이블에서 부서번호를 조회
-- 단, 같은 부서번호는 조회하지 않는다.
-- 여러행이 조회되는 컬럼과 같이 사용되더라도 에러가 발생하지 않는다.

select distinct DEPTNO
from emp
order by deptno;

-- group by를 사용한 중복배제
-- 여러행이 조회되는 컬럼과 같이 사용되면 에러가 발생한다.
select deptno
from emp
group by deptno;

-- 사원테이블에서 사원수가 3명을 초과하는 부서의 부서번호, 사원수를 조회
select deptno, count(deptno)
from emp
group by deptno
having count(deptno) > 3; -- having절에 집계함수 사용 가능











