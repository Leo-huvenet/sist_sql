	-- 변환함수 --
--숫자변환
-- 0 데이터가 없으면 0을 채우고
-- 9 데이터는 있는 것만 보여준다.
select to_char(2021, '0,0000,000'), to_char(2021.20210319,'00000000.00'),
  to_char(2021, '0,0000,000'), to_char(2021.20210319,'00000000.00')
	from dual;

select to_char(13*721231123, '9,999,999,999,999,999,999')
from dual;

-- 날짜변환
-- 포멧은 날짜형식이거나 특수문자가 아닌 문자를 사용할 수 없다. Error
-- 날짜형식이 아니거나 특수문자가 아닌 경우에는 ""를 사용하여 해당 문자를 표현한다.
select to_char( sysdate, 'yyyy-mm-dd dy"요일" day am hh12 hh hh24:mi:ss q')
from dual;

-- 날짜형식이 길면 error
select to_char(sysdate, 'yyyy " 년 " mm " 월 " dd " 일 " q"분기" hh24 " 시" mi " 분" ss " 초 "')
from dual;

--사원테이블에서 사원번호, 사원명, 입사일 조회
--단, 입사일은 '월-일-년 분기'의 형식으로 조회할 것.
select EMPNO, ENAME, to_char(HIREDATE, 'mm-dd-yyyy q"분기"') as hiredate
from emp;

-- 사원테이블에서 1981년에 입사한 사원들의 사원번호, 사원명, 연봉, 입사일, 직무를 조회
select EMPNO, ENAME, SAL, HIREDATE, JOB
from emp
where to_char(HIREDATE, 'yyyy') Like '1981';

-- 숫자변환
-- 문자열이 숫자형식이라면 to_number사용하지 않아도 형변환이 된다.
select '3'+'19', to_number('3') + to_number('19')
from dual;

-- 날자형식의 문자열을 Date형으로 변환
select '2021-03-19', to_date('2021-03-19','yyyy-mm-dd')
from dual;

-- Date형의 컬럼에 값추가
--현재날짜
insert into test1(input_date) values(sysdate);
--다른날짜 : 날짜형식의 문자열사용. 시간정보가 없어서 00시00분00초로 추가
insert into test1(input_date) values('2021-03-20');
--다른날짜 : to_date함수 사용
insert into test1(input_date) values(to_date('2021-03-21','yyyy-mm-dd'));

select to_char(input_date, 'yyyy-mm-dd am hh24:mi:ss') from test1;

-- to_date가 error를 발생하는 경우 : to_char함수 사용
select /* to_char('2021-03-19', 'mm-dd-yy') */
			 to_char(to_date('2021-03-19', 'yyyy-mm-dd'),'mm-dd-yy')
from dual;

--조건함수--
select decode('d', 'a','에이','b','비','c','씨','제트')
from dual;

-- 사원테이블에서 사원번호, 매니저번호, 부서번호, 부서명 조회
-- 단, 부서명은 부서번호에 따라 아래와같이 설정하여 조회
-- 			10- SI개발, 20-SM유지보수, 30-SE엔지니어 그외라면 영업

select EMPNO, MGR, DEPTNO, decode(DEPTNO,10,'SI개발',20,'SM유지보수',30,'SE엔지니어','영업') as DNAME
from emp;

-- 사원테이블에서 사원번호, 사원명, 부서번호, 연봉, 부서별 보너스를 조회
--단, 부서별보너스는 아래와같이 설정한다.
--	10번부서 연봉에 20%로 책정, 20번부서 연봉25%로 책정
-- 30번부서는 연봉+보너스를 합산한 금액의 15%로 책정
-- 그외는 연봉에 100%로 책정한다.

select EMPNO, ENAME, DEPTNO, SAL
		,decode(DEPTNO,10,'20%',20,'25%',30,'15%')
			,decode(DEPTNO,10,SAL*0.2,20,SAL*0.25,30,(SAL+nvl(COMM,0))*0.15) as deptno_sal
from emp;

