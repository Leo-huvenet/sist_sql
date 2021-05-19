
select * from EMP;

-- 1번
-- 사원테이블에서 사원번호, 사원명,직무, 매니저번호,연봉,입사일을 조회하세요.
-- 단, 입사일은 월-일-년의 형식으로 출력하세요.
-- 연봉은 3자리마다 ,를 넣어 출력하세요.
select EMPNO, ENAME, JOB, MGR, to_char(SAL,'9,999,999') as sal, to_char(HIREDATE,'mm-dd-yyyy') as HIREDATE
from EMP;

-- 2번
-- 사원테이블에서 3,4분기에 입사한 사원들의  사원번호,사원명,연봉,직무, 입사일을 조회하세요.
select EMPNO, ENAME, SAL, JOB, HIREDATE
from emp
where to_char(HIREDATE,'q') = '3' or to_char(HIREDATE,'q') = '4';

-- 3번
-- 사원테이블에서 부서번호, 사원번호, 연봉, 보너스, 총수령액, 입사일을 조회하세요.
-- 단. 총수령액은 '연봉+월급+보너스'를 합산한 금액으로 조회하세요.
-- 월급은 연봉을 12로 나눈 값을 원단위 절사하여 계산하세요.
select DEPTNO, EMPNO, SAL, COMM, round(SAL/12)+SAL+COMM as Total,HIREDATE
from EMP;

-- 4번
-- 사원 테이블에서 부서번호,사원명,연봉, 보너스, 인센티브를 조회하세요.
-- 인센티브는  아래표와 같이 부서별로 차등 지급합니다.
-- 10- 월급에 100%, 20- 월급에 150%, 30 - 월급에 300% 그외 월급에 50%
select DEPTNO, ENAME, SAL, COMM
	,round(decode(DEPTNO,10,(SAL/12)*1,20,(SAL/12)*1.5,30,(SAL/12)*3,(SAL/12)*0.5)) as Incentive
from emp;

-- 5번
-- test1 테이블에서 이름 ,나이,태어난해, 주민번호,  성별을 조회 하세요.
-- 성별은 주민번호의  8번째 자리로 구하고,
-- 8번째 자리가 1,3이면 '남자', 2,4면 '여자' 5,6,7,8이면 '외국인'그렇지
-- 않으면 "오류" 로 출력한다.
-- 태어난해는 나이를 사용하여 구한다.
select *
from test1;

select NAME, AGE, to_char(INPUT_DATE,'YYYY')-AGE+1 AS BRITHDAY, SSN
	, decode(substr(SSN,8,1),'1','남자','3','남자','2','여자','4','여자','5','외국인','6','외국인','7','외국인','8','외국인','오류') as gender
from test1;



