SELECT *
FROM EMP;

-- 사원 테이블에서 10번 부서에 근무하는 사원들의 사원번호, 사원명, 매니저번호,
-- 연봉,부서번호를 조회

select EMPNO, ENAME, MGR , SAL, deptno
from emp
where deptno = 10;

-- 사원테이블에서 10번 부서가 아닌 부서사원들의 사원번호, 사원명, 매니저번호,
-- 입사일, 부서번호를 조회
select EMPNO, ENAME, MGR, HIREDATE, DEPTNO
from EMP
WHERE DEPTNO != 10;
-- WHERE DEPTNO <> 10;

-- 사원테이블에서 연봉이 1600초과인 사원들의 사원번호,연봉,사원명,직무,
-- 입사일을 조회
select EMPNO, SAL, ENAME, JOB, hiredate
from emp
WHERE SAL > 1600;

-- 사원테이블에서 연봉이 1600이상 3000 이하인 사원의 사원명, 사원번호, 연봉,
-- 직무를 조회
select ENAME, EMPNO, SAL, JOB
from emp
WHERE SAL BETWEEN 1600 AND 3000;

-- 사원테이블에서 7902, 7698, 7566 매니저가 관리하는 사원의 사원번호, 사원명,
-- 매니저 변호, 입사일, 직무 조회

select  EMPNO, ENAME, MGR, HIREDATE, JOB
from  EMP
WHERE MGR IN(7902,7698,7566);
-- WHERE MGR = 7902 OR MGR = 7698 OR MGR = 7566;

-- 사원테이블에서 보너스를 받는 사원들의 사원번호, 연봉, 보너스, 사원명, 직무를 조회
-- is null, is not null
select  EMPNO, SAL, ENAME, JOB
from  EMP
Where comm is not null;
-- WHERE COMM >= 0;

--사원테이블에서 사원명이 'ALLEN'인 사원의 사원번호, 사원명, 입사일, 직무, 부서번호를 조회
SELECT EMPNO, ENAME, JOB, DEPTNO
FROM EMP
WHERE ENAME LIKE 'ALLEN';
-- WHERE ENAME = 'ALLEN';


-- 사원테이블에서 사원명이 'A'로 시작하는 사원들이 사원명, 연봉, 직무, 입사일
-- 조회
SELECT EMPNO, SAL, JOB, HIREDATE
FROM ENO;
WHERE ENAME LIKE 'A';

--사원테이블에서 사원명이 'S'로 끝난 사원들의 사원명, 연봉, 사원번호, 매니저번호,
-- 입사일을 조희
SELECT EMPNO, SAL, JOB, HIREDATE
FROM EMP
WHERE ENAME LIKE '%ES';

--사원테이블에서 서원명에 'A'가 들어있는 사원들의 사원명, 연봉, 사원번호,
-- 입사일을 조회
SELECT EMPNO, SAL, JOB, HIREDATE
FROM EMP
WHERE ENAME LIKE '%A%';

-- 사원테이블에서 사원명에 'l'이 두개 있는 사람들의 사원명, 매니저번호, 직무를 조회
 SELECT EMPNO, SAL, JOB, HIREDATE
FROM EMP
WHERE ENAME LIKE '%L%L%';

-- 사원테이블에서 사원명이 5글자인 사요원이 사원명 조회
SELECT ENAME
FROM EMP
WHERE ENAME LIKE '_____';

-- 사원테이블에서 이름이 5갈자이면서 두번째글자가 '0'인 사원의
-- 사원번호, 사원명, 입사일, 연봉을 조회

SELECT EMPNO, ENAME, HIREDATE, SAL
FROM EMP
WHERE ENAME LIKE '_0___';












