-- rollback연습

create table test1(
	name varchar2(15),
	age number(3)
	);

insert into test1(name,age) values('김덕영',26);

select *
from test1;
commit;

insert into test1(name,age) values('이학민',38);

update test1
set age=26
where name = '이학민';

rollback;

-- savepoint 사용 --
savepoint insert_a;
insert into test1(name,age) values('진재혁',300);

savepoint update_b;
update test1
set age = 30
where name = '진재혁';

savepoint delete_c;
delete from test1
where name = '진재혁';

select *
from test1;

--rollback to update_b;

--rollback to insert_a;

--rollback to delete_c;

-- select --
-- 사원 테이블에서 사원번호, 사원명, 연봉, 보너스, 총수령액을 조회
-- 단, 총 수령액은 연봉과 보너스를 합산한 금액
select EMPNO, ENAME, SAL, COMM, SAL+COMM as TotalSal
from EMP ;

-- alias --
-- 컬럼명 alias, 컬럼명 as alias
-- 대소문자 구분하는 컬럼의 사용. 컬럼명 "alias"
-- 같은 컬럼을 여러개 조회하면, alias가 자동 생성되여 부여된다.
select DEPTNO d_no, DNAME as dn, LOC "LoC", LOC 위치, LOC "L oc"
from DEPT ;

-- 컬럼명의 alias는 where 절에서 사용할 수 없다.
select DEPTNO d_no, DNAME
from DEPT
where deptno = 10;

-- 부서테이블에서 부서번호, 부서명, 위치 조회
-- 단, 부서번호는 현재부서번호에서 -3을 연산한 값으로 조회
select DEPTNO,DEPTNO-3 new_deptno, DNAME, LOC
from DEPT;

-- 산술연산자가 아닌 다른 연산자는 조회하는 컬렴명에 사용할 수 없다.
-- select empno > 10
-- from emp;

-- 문장형식의 출력
-- 사원테이블에서 사원명에 '님'을 붙여 조회
select ename||'님', '님'||ename, empno||ename
from emp;

-- 사원테이블에서 사원번호, 사원명, 연봉을 조회
-- 단, 조회형식은 사원명(사원번호)님의 연봉은 XXX$입니다. 로 조회하고
-- 컬럼명은 output으로 설정할 것
select ENAME||'('||EMPNO||')님의 연봉은'|| SAL||'$입니다.'as output
from emp;

-- 사원테이블에서 사원번호, 사원명, 직무, 연봉, 세금을 조회
-- 단, 세금은 연봉에서 3.3로 계산하여 출력할 것.
-- 세금계산한 컬럼에는 alias 사용
select EMPNO, ENAME, JOB, SAL, SAL*3.3*0.01 AS TAX
from emp;

-- 사원테이블에서 사원번호, 사원번호결과, 사원명 조회
-- 단, 사원번호결과는 짝수면 0을 홀수면 1을 조회할 것
select EMPNO, mod(EMPNO,2) EMPNO_result ,ENAME
from emp;


