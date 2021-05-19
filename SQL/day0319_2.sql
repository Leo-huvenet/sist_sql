--문자열함수--
--문자열길이
select length('test'), length('오늘은 금요일')
from dual;

--사원테이블에서 사원명이 4글자인 사원의 사원명, 사원번호, 입사일 조회
select ename, empno, hiredate
from emp
where length(ename)>=4;

-- 대문자, 소문자 변환
select upper('abcd') ,upper('Abcd'), lower('ABCD'), lower('AbCd')
from dual;

-- 사원테이블에서 사원명이 'scott'인 사원의 사원번호, 사원명, 직무, 연봉, 입사일을 조회
select EMPNO, ENAME, JOB, SAL, HIREDATE
from EMP
where lower(ename) = 'scott';  --소문자로 바꿔서 조회
-- where ENAME like upper('scott'); -- 대문자로 바꿔서 조회

select * from emp;

-- 첫글자를 대문자로, 공백이후의 첫글자도 대문자로 바꿔준다
select initcap('java'), initcap('oracle'), initcap(' html')
from dual;

--문자열내에 특정문자열의 인덱스얻기(오라클 시작인덱스는 1번)
select instr('test', 'e'), instr('test','k')
from dual;

-- 사원테이블에서 사원명에 'A'가 있는 사원의 사원명, 사원번호, 연봉을 조회
select ENAME, EMPNO, SAL
from  EMP
where instr(ename,'A') != 0;
-- where instr(ename,'A') <> 0;

-- 문자열 자르기
-- 시작문자로 부터 자를 때에는 시작인덱스를 0또는 1로 사용할 수 있다.
select substr('abcdefg',3,4), substr('abcdefg',3), substr('abcdefg',0,4)
,substr('abcdefg',1,4)
from dual;

-- 문자열합치기
select 'ABC'||'DEF'||'HIJ', CONCAT( CONCAT('ABC','DEF'),'HIJ')
FROM DUAL;

--공백제거
-- 앞뒤공백제거
select '['||trim('   A BC   ')||']','['||ltrim('   A BC   ')||']', '['||rtrim('   A BC   ')||']'
from dual;

-- 문자열이 특정문자열로 감싸져 있을 때 문자열을 삭제할 수 있다.
-- trim( 지울문자열 form 문자열)
select trim('a' from 'aaaaaaOracleaaaaaa')
from dual;

-- 문자열 치환
select replace('abcabcabc', 'bc', 'a')
from dual;

-- 사원테이블에서 사원명을 조회
-- 단, 사원명에 'A'를 'a'로 변경하여 조회
select ENAME, replace(ENAME,'A','a'), initcap(ename)
from emp;

-- 사원테이블에서 사원번호, 사원명, 입사일을 조회
-- 단, 사원번호 SIST_0000001111 의 형식으로 조회할 것

select EMPNO, CONCAT('SIST_',Lpad(EMPNO, 10,0)) AS FORMAT_EMPNO, ENAME, HIREDATE
from EMP

