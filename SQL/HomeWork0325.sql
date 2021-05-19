-- 숙제1

alter table cp_emp2 modify hiredate date default sysdate;
-- sysdate를 기본값으로 주면  hiredate를 쓰지 않아도 된다.

insert into cp_emp2(EMPNO,ENAME, JOB, SAL, MGR) values(1111,'강인섭','사원',2800,7902);
insert into cp_emp2(EMPNO,ENAME, JOB, SAL, MGR) values(1112,'김덕영','사원',2800,7902);
insert into cp_emp2(EMPNO,ENAME, JOB, SAL, MGR) values(1113,'박기범','대리',3200,7893);

-- 숙제2
select * from EMp; -- 본사 사원정보

select * from cp_emp2; -- 지사 사원정보

select rnum, ENAME, JOB, to_char(SAL,'000,000,000') SAL, to_char(HIREDATE,'yyyy-mm-dd q"분기"')HIREDATE from(
	select rownum rnum, ENAME, JOB, SAL, HIREDATE from(
		select ENAME, JOB, SAL, HIREDATE from(
			select EMPNO, ENAME, JOB, SAL,  HIREDATE, '본사'
			from emp
			union all
			select EMPNO, ENAME, JOB, SAL, HIREDATE, '지사'
			from cp_emp2
			)
		order by HIREDATE desc
	)
)
where rnum between 3 and 10;

-- 내가 푼 풀이 문제점 : 함수는 제일 바깥쪽 select에서 사용하기 !!
--------------------------------------------------
-- 선생님 풀이
select EMPNO, ENAME, JOB, to_char(SAL,'000,000,000') SAL, MGR, to_char(HIREDATE,'yyyy-mm-dd q"분기"') HIREDATE, DEPT_LOC
from(SELECT EMPNO, ENAME, JOB, SAL, MGR, HIREDATE, DEPT_LOC,
			 ROW_NUMBER() OVER( ORDER BY HIREDATE DESC) r_num
		 FROM(select EMPNO, ENAME, JOB, SAL, MGR, HIREDATE, '본사' dept_loc
		 		  from emp
		 		  union all
		 		  select EMPNO, ENAME, JOB, SAL, MGR, HIREDATE, '지사'
				  from cp_emp2
		 		  ))
WHERE  R_NUM BETWEEN 3 AND 10;

