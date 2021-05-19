 -- select subquery --
 -- 단수행
 -- emp테이블에서 사원번호가 '7369'번 사원이 근무하는 부서번호를 조회하여,
 -- cp_emp1테이블에 같은 부서사원의 정보를 모두 조회
 select * from emp;
 select * from cp_emp1;

 select empno, ename, deptno, job, sal
 from cp_emp1
 where deptno = ( select deptno from emp where empno = 7369);

 -- 모델명이 '그랜저'인 차량의 제조국 조회

 select * from car_country;
 select * from CAR_MAKER;
 select * from CAR_MODEL;

 select country
 from car_country
 where maker = (select maker from CAR_MAKER where model = '그랜저');

 -- 제조사가 '현대'인 차량의 모델명, 연식, 가격, 옵션을 조회
 select MODEL, CAR_YEAR, PRICE, CAR_OPTION
 From CAR_MODEL
 where model in(select model from car_maker where maker = '현대') ;

 -- scalar subquery --

 -- 조회된 값을 사용하여 다른테이블의 컬럼 값을 조회하여 보여줄 때
 -- 사원번호, 사원명, 부서번호, 부서명 조회
 select empno, ename, deptno,
 	(select dname from dept where dept.deptno = emp.deptno) as dname
 from emp;


 -- car_model, car_maker 사용
 -- 년식이 2012년인 차량의 모델명, 년식, 가격, 옵션, 입력일, 이미지, 제조사를 조회

 select * from car_model;

 select MODEL, CAR_YEAR, PRICE, CAR_OPTION, HIREDATE, CAR_IMG,
 	(select maker from CAR_MAKER where car_maker.model = car_model.model) as maker
 	from car_model
 	where CAR_YEAR  = '2012';

 	-- select 다중행 subquery (검색된 결과를 거지고 재조회 : inline view를 사용한 조회)
 	-- 형식
 	select empno, ename, job, sal, hi -- inline view에 존재하는 컬럼과 레코드를 검색
 	-- alias가 실제컬럼명처럼 사용.
 	from (select empno, ename, sal, job, hiredate as hi from emp)
	where to_char(hi,'yyyy') = '1980';


 -- rownum --
 -- 사원테이블에서 입사년이 '1981'년인 사원들의 순차번호, 사원번호, 입사일을 조회
 -- 조회결과에 가상번호를 사용
 select rownum, empno, ename, hiredate
 from emp
 where to_char(hiredate, 'yyyy') = '1981';

 -- rownum는 order by보다 먼저 생성되므로 정렬하면 번호가 섞인다.
 -- 사원테이블에서 순차번호, 사원번호, 사원명, 직무를 조회
 -- 단, 사원명의 오름차순으로 정렬하여 조회
 select rownum, empno, ename, job
 from emp
 order by ename;

 -- 1번부터는 조회가되나 이후번호부터는 조회되지 않는다.
 -- 사원테이블에서 번호, 사원번호, 사원명을 조회
 -- 단, 번호가 1~5번 까지의 레코드만 출력
	select rownum, empno, ename
	from emp
	where rownum between 1 and 5;
--  where rownum >= 1 and rownum < 6;

-- select마다 같은 이름으로 따로 사용된다(ROWNUM 번호가 2개표시됨)
select rownum, rnum, ename, empno
from ( select rownum as rnum, ename, empno from emp order by ename);

-- 사원테이블에서 가장마지막에 입사한 이전사원부터 5건의 사원정보를 조회
-- (2~6번까지 조회
-- 가장 마지막에 입사한 사원에게 1번을 부여
 select * from EMP ;

select rnum, EMPNO, ENAME, JOB, HIREDATE
from (select rownum rnum, EMPNO, ENAME, JOB, HIREDATE  -- rownum은 1번부터만 조회되므로 rownum을 실제컬럼처럼 인식
 			from(select EMPNO, ENAME, JOB, HIREDATE
			 		 from emp
			     order by HIREDATE desc
					)
		 )
where rnum between 2 and 6;
----------------------------------------------------------
select EMPNO, ENAME, JOB, HIREDATE, rnum
from(select EMPNO, ENAME, JOB, HIREDATE,
				row_number() over(order by HIREDATE desc) as rnum
from emp)
where rnum between 2 and 6;

-- 우편번호 테이블에서 시도가 '서울'인 레코드를 dong의 내림차순으로
-- 정렬했을 때 150~200번 사이의 레코드를 조회
-- 단, 번지가 null 이면 '번지없음'; 으로 조회
-- 조회컬럼 : 우편번호, 시도, 구군, 동, 번지를 조회
select * from ZIPCODE;

select zipcode, sido, gugun, dong, nvl(bunji,'번지없음') as bunji
from(select ZIPCODE, SIDO, GUGUN, DONG, BUNJI,
			 row_number() over(order by dong desc) flag_num
 		 from zipcode
 		 where sido = '서울')
where flag_num between 150 and 200;




