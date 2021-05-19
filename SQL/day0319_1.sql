select '강인섭' name, 20 age
from dual;

--수치함수--

-- 절대값
select abs(-3), abs(3)
from dual;

-- 반올림 round(값, 반올림 했을 때 볼 자릿수)
select round(555.555, 2), round(555.554, 2), round(555.555), round(555.555, -1)
from dual;

-- 올림 ceil(값)
select ceil(10.1), ceil(10.0)
from dual;

-- 내림 floor()
select floor(10.9), floor(10.0)
from dual;

-- 절사 trunc()
select trunc(555.555, 2), trunc(555.555, 1), trunc(555.555, -1)
from dual;

-- 사원테이블에서 사원번호, 사원명, 연봉, 세금을 조회
-- 단, 세금은 연봉에 3.3%계산하여 원단위 절사하여 조회
select EMPNO, ENAME, SAL, trunc(SAL*0.033) as tax
from EMP;

--null변환--
select nvl('','널'), nvl(null,'변환값')
from dual;

-- 사원테이블에서 사원번호, 사원명, 연봉, 보너스를 조회
-- 단, 보너스를 수령하지 않는 사원은  100으로 설정하여 출력한다.
select ENAME, EMPNO, SAL, nvl(COMM,100) as comm
from EMP;

-- 사원테이블에서 사원번호, 사원명, 연봉, 보너스, 총수령액 조회
-- 총수령액은 연봉과 보너스를 합산한 금액
select EMPNO, ENAME, SAL, COMM, SAL+NVL(COMM,0) AS TOTAL
FROM EMP;

--NULL이 아닐 때 제공할 값과 null일 때 제공할 값을 설정
select nvl2('','null이 아닐 때','null일 때'), nvl2('a','null이 아닐 때','null일 때')
from dual;

-- 사원 테이블에서 사원번호, 사원명, 매니저존재여부를 조회
-- 매니저가 존재하면 0, 매니저가 존재하지 않으면 1을 조회
select EMPNO, ENAME, nvl2(MGR,0,1)
from emp;

--insert 컬럼에 null이 입력되는 상황--
--number나 date는 컬럼이 생략된 경우에 null입력
alter table test1 add input_date date;

insert into test1(name) values('테스트');
select * from test1;
commit;

-- varchar2나 char는 컬럼이 생략된 경우와 ''가 입력되는 경우에 null이 입력
-- 컬럼이 생략된 경우
insert into test1(age,input_date) values(20,sysdate);
-- ''입력된경우
insert into test1(name,age,input_date) values('',30,sysdate);

select * from test1;
commit;

-- test1테이블에서 이름, 나이를 조회
-- 단, 이름이 null인경우 '없음'으로 나이가 null인 경우 0으로 출력
select nvl(name,'없음') name,nvl(age,0)
from test1;



