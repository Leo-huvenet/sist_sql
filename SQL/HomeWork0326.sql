-- 문제1
select CC_num, COUNTRY, MAKER, MODEL, ltrim(to_char(CAR_YEAR,'9,999,999')) CAR_YEAR, ltrim(to_char(PRICE,'9,999,999')) PRICE,
			 CAR_IMG, TO_CHAR(HIREDATE,'mm-dd-yyyy') HIREDATE, CC, substr(CAR_OPTION, 1,instr(CAR_OPTION,','))

from(select COUNTRY, MAKER, MODEL, CAR_YEAR, PRICE,
			 		CAR_IMG, HIREDATE, CC, row_number() over (order by CC desc) CC_num, CAR_OPTION
		 from(select cc.COUNTRY, cc.MAKER, cma.MODEL, cmo.CAR_YEAR, cmo.PRICE,
								cmo.CAR_IMG, cmo.HIREDATE, cmo.cc, cmo.CAR_OPTION
		 		  from   CAR_COUNTRY cc, CAR_MAKER cma, CAR_MODEL cmo
		 		  where  (cc.maker = cma.maker(+) and cmo.model(+)= cma.model)
						 		  and cmo.CC between 1500 and 3000
    		 )
     )
where CC_num between 3 and 6;

-- 문제2
select empno_num, EMPNO, ENAME, to_char(HIREDATE, 'mm-dd-yyyy day') HIREDATE, sal,
			 row_number() over(order by sal) sal_rank, DEPTNO, DNAME, LOC,
			 substr(ZIPCODE,instr(ZIPCODE,'-'),4) ZIPCODE, SIDO, GUGUN, DONG, nvl(BUNJI,'번지없음') BUNJI
from(select row_number() over (order by EMPNO) empno_num, empno, ENAME, HIREDATE, SAL, DEPTNO, DNAME, LOC, ZIPCODE, SIDO, GUGUN, DONG, BUNJI
		 from(select e.EMPNO, e.ENAME, e.HIREDATE, e.SAL, d.DEPTNO, d.DNAME, d.LOC, z.ZIPCODE, z.SIDO, z.GUGUN, z.DONG, z.BUNJI
		 			from DEPT d, EMP e, ZIPCODE z
		 			where ( e.deptno(+) = d.deptno and z.seq(+) = e.empno )
		 			and d.deptno in(10,30,40)
		 			)
		 )
where	empno_num between 2 and 5;

-- 문제3
select COUNTRY, initcap(MAKER), MODEL, CAR_YEAR, PRICE, CAR_OPTION, substr(CAR_IMG,1,instr(CAR_IMG,'.')-1) img, substr(CAR_IMG,instr(CAR_IMG,'.'),4) extension, CC
from(select cc.COUNTRY, cc.MAKER, cmk.MODEL, cmd.CAR_YEAR, cmd.PRICE, cmd.CAR_OPTION, cmd.CAR_IMG, cmd.CC
		 from CAR_COUNTRY cc, CAR_MAKER cmk, CAR_MODEL cmd
		 where (cmk.maker(+) = cc.maker and cmd.model(+) = cmk.model)
			 		 and cc.MAKER in('현대','기아','삼성','BMW','AUDI')
			 		 and cmd.CAR_OPTION LIKE '%TCS%'
			 		 and cmd.CAR_OPTION LIKE '%ABS%'
		)
order by CAR_YEAR desc, PRICE desc;

-- 문제4
select rownum,'['||model||']차량의 연식은 ['||car_year||']이고, 제조국은['||country
			||']이며,['||maker||']사가 제조사입니다. 가격은 ['||to_char(price,'0,000,000')||']원 입니다.' output
from(select cmo.model, cmo.car_year, cc.country, cc.maker, cmo.price,
		 row_number() over(order by price) rnum
		 from 	car_country cc, car_maker cma, car_model cmo
		 where (cma.maker = cc.maker and cmo.model(+) = cma.model)
			 		  and cmo.model in ('K5','아반테','소렌토','A8','SM3'))
where	rnum between 2 and 7;

-- 문제5
select cc.maker, cmk.MODEL, cmd.CAR_YEAR, sum(cmd.PRICE) year_price
from CAR_COUNTRY cc, CAR_MAKER cmk, CAR_MODEL cmd
where (cmk.maker(+) = cc.maker and cmd.model(+) = cmk.model)
			 and cc.maker = '현대'
group by cc.maker, cmk.MODEL, cmd.CAR_YEAR;

-- 문제6
SELECT e.EMPNO, lower(e.ENAME)ENAME, e.HIREDATE, e.SAL, trunc(e.SAL*0.033) TAX,
			 trunc(e.SAL+(e.SAL/12)+(nvl(e.COMM,0))-(e.SAL*0.033),0) netpay,
			 ltrim(to_char(decode(d.DEPTNO,10,e.SAL*0.07,20,e.SAL*0.04,30,(e.SAL+nvl(e.COMM,0))*0.1,e.SAL*0.03), '9,999'))as ASIA,
			 d.DEPTNO, lower(d.DNAME)DNAME, lower(d.LOC)LOC, z.ZIPCODE, z.SIDO, z.GUGUN, z.DONG, z.BUNJI
FROM DEPT d, EMP e, ZIPCODE z
WHERE ( e.deptno = d.deptno and z.seq = e.empno )
			 and (e.ename like '%S' or e.ename like '__A__');

-- 문제7
select * from user_tab_cols
where table_name = 'EMP';
select * from user_cons_columns
where table_name = 'EMP';
select * from user_constraints
where table_name = 'EMP';


SELECT TABLE_NAME, COLUMN_NAME, DATA_TYPE,
       case when DATA_TYPE = 'NUMBER' AND DATA_LENGTH = 22 then DATA_PRECISION ELSE DATA_LENGTH END AS DATA_LENGTH,
       DATA_DEFAULT, CONSTRAINT_NAME
FROM(
		 SELECT utc.TABLE_NAME, utc.COLUMN_NAME, utc.DATA_TYPE, utc.DATA_PRECISION, utc.DATA_LENGTH, utc.DATA_DEFAULT, ucc.CONSTRAINT_NAME
		 FROM user_tab_cols utc, user_cons_columns ucc
		 WHERE (utc.table_name = ucc.table_name)
		)
WHERE TABLE_NAME LIKE 'EMP';

-------------------------------------------------------
-- 강사님 풀이
select * from user_tab_cols
where table_name = 'EMP';
select * from user_cons_columns
where table_name = 'EMP';
-- 특정 테이블의 모든 제약을 검색
select * from user_constraints
where table_name = 'EMP';
-- 특정 테이블의 특정 제약 검색

select  utc.column_name, utc.data_type,
        nvl(utc.data_precision,utc.data_length ) data_length,
        utc.data_default, ucc.constraint_name,uc.constraint_type
from 		user_tab_cols utc,user_cons_columns ucc,user_constraints uc
where 	(utc.column_name=ucc.column_name and ucc.constraint_name=uc.constraint_name)
			 and utc.table_name='EMP' ;

