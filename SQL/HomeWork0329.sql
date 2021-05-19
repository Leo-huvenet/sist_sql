-- 槛力1
create view emp_view as
select rnum, DEPTNO, DNAME, LOC, EMPNO, ENAME, SAL, nvl(COMM,100)as comm ,h_num, HIREDATE,
			 ZIPCODE, SIDO, GUGUN, DONG, BUNJI
from(select rownum as rnum,DEPTNO, DNAME, LOC, EMPNO, ENAME, SAL, comm , h_num, HIREDATE,
			 ZIPCODE, SIDO, GUGUN, DONG, BUNJI
		 from(select  d.DEPTNO, DNAME, LOC, EMPNO, e.ENAME, SAL, COMM,row_number() over (order by HIREDATE) as h_num, HIREDATE,
					  ZIPCODE, SIDO, GUGUN, DONG, BUNJI
		 		  from dept d, emp e, zipcode z
		 		  where (e.deptno(+) = d.deptno and e.empno = z.seq(+))
				  )
		);

-- 槛力2
select * from emp_view;

-- 槛力3
select rnum, DEPTNO, DNAME, LOC, EMPNO, ENAME, SAL, nvl(COMM,100)as comm ,h_num, HIREDATE,
			 ZIPCODE, SIDO, GUGUN, DONG, BUNJI
from emp_view
where rnum between 10 and 20;

-- 槛力4
drop view emp_view;

-- 槛力5
revoke create view from scott;
revoke create synonym from scott;
