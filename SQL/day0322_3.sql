-- create subquery --
-- 테이블 복사할 때 사용 (조회된 결과를 사용하여 테이블을 생성 할 때)
-- 원천 데이터에서 필요한 데이터를 추출하여 저장할 때

-- 사원테이블에서 부서번호가 10번 30번인 부서사원의 사원번호, 사원명, 부서번호,
-- 직무, 연봉을 조회하고 cp_emp1테이블을 생성하여 추가하세요.
CREATE TABLE cp_emp1 as
(select EMPNO, ENAME, DEPTNO, JOB, SAL
from emp
--where DEPTNO = 10 OR DEPTNO = 20;
WHERE  DEPTNO IN(10,20));

select * from cp_emp1;

drop table cp_emp1;




-- DBMS에서 운영하기 위한 정보를 저장하는 테이블을 Data Dictionary라고 한다.
-- DD는 사용자가 직접 insert, update, delete를 할 수 없고, 작업하는 쿼리에 따라
-- 자동으로 insert, update, delete가 수행된다.
-- DD는 사용자가 select만 가능하다.
-- 제약사항을 확인할 수 있는 DD는 user_constraints 이다.
select * from user_constraints
where table_name = 'EMP';

-- cp_emp1 table은 컬럼명, 데이터형, 크기, 레코드는 emp에서 그대로 복사 되었으나
-- 제약사항을 복사되지 않는다.
select * from user_constraints;

-- 사원테이블에서 사원번호, 사원명, 직무, 연봉, 매니저번호, 입사일을 조회하여
-- 생성된 inline view를 사용하여 cp_emp2 테이블을 생성하세요.
create table cp_emp2 as
(select EMPNO , ENAME, JOB, SAL, MGR, HIREDATE
from emp );

select * from CP_EMP2;

-- 사원테이블에서 사원번호, 사원명, 직무, 매니저번호, 입사일, 연봉의 컬럼명, 데이터형
-- 크기를 그대로 가진 cp_emp3 테이블을 생성해보세요 ( 레코드 없이 테이블의 구조만 복사 )
-- 레코드가 검색되지 않도록 SELECT문 작성...
create table cp_emp3 as(
select EMPNO, ENAME, JOB, MGR, HIREDATE, SAL
from EMP
WHERE 1=0);
--where 1=1; -> 항상 true
--where 1=0; -> 항상 false

drop table cp_emp3;

select * from CP_EMP3;

-- insert subquery --
-- 단수행 : 다른컬럼의 값을 사용하여 레코드를 추가할 때
-- cp_emp1테이블에 아래와 같은 사원정보를 추가
-- 사원번호 : 1212, 사원명 : 한상민, 부서번호 : 15번
-- job(직급) : 대리 연봉 : emp테이블의 사원 번호가 7788인
-- 사원과 동일한 연봉.
insert into cp_emp1(EMPNO, ENAME, DEPTNO, JOB, SAL)
values(1212,'한상민', 15, '대리',
( select sal from emp where EMPNO = 7788 ));

commit;

select * from CP_EMP1;

-- cp_emp1테이블에 아래와 같은 사원정보를 추가
-- 사원번호 : 1213, 사원명 : 이학민, 부서번호 : emp테이블의 사원번호가
-- 7369인 사원과 동일한 부서번호로 추가,
-- job(직급) : emp테이블의 사원명이 JONES인 사원의 직급과 동일한 직무로,
-- 연봉 : emp테이블의 사원 번호가 7521인 사원과 연봉보다 100 많은 연봉으로 추가
insert into cp_emp1(EMPNO, ENAME, DEPTNO, JOB, SAL)
VALUES(1213,'이학민',
(SELECT DEPTNO FROM EMP WHERE DEPTNO = 7369),
(SELECT JOB FROM EMP WHERE ENAME = 'JONES'),
(SELECT SAL+100 FROM EMP WHERE EMPNO = 7521));





