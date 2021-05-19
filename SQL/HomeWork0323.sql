-- 槛力1
create table emp_work(
	EMPNO number(4),
	ENAME varchar2(10),
	SAL number(7,2),
	HIREDATE date,
	DEPTNO number(2),
	JOB varchar(9),
	MGR number(4));

insert into emp_work
(select EMPNO, ENAME, SAL, HIREDATE, DEPTNO, JOB, MGR
from emp
where SAL between 1500 and 3000);

select * from EMP_WORK;

-- 槛力2
insert into EMP_WORK
(select EMPNO+1000, ENAME, SAL, HIREDATE, DEPTNO, JOB, MGR
from emp
where DEPTNO in(10,30));

-- 槛力3
update emp_work
set sal = (select sum(sal) from emp where EMPNO in('7369','7782'))
where DEPTNO = '10';

-- 槛力4
select  price_desc, MODEL, CAR_YEAR, CAR_OPTION, HIREDATE
	from(select  MODEL, CAR_YEAR, row_number() over(order by price desc) as price_desc, CAR_OPTION, HIREDATE
			 from CAR_MODEL
			 where model in(select model from CAR_MAKER WHERE MAKER = '泅措'))
where price_desc between 2 and 5;

