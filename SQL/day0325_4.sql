--union : 서로다른 테이블 위, 아래로 조합하여 조회
-- emp : 한국본사 사원정보, cp_emp1 : 미국지사 사원정보
-- 본사와 지사 사원정보를 조회
-- 조회컬럼은 사원번호, 사원명, 직무, 연봉
select EMPNO, ENAME, JOB, SAL
from emp
union all
select EMPNO, ENAME, JOB, SAL
from cp_emp1  ;

-- 정상조회
select EMPNO, ENAME, JOB, SAL
from emp
where empno = 7369
union all
select EMPNO, ENAME, JOB, SAL
from cp_emp1
order by empno ;
