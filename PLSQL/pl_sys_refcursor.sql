-- sys_refcursor 사용 : 커서의 선언과 쿼리문을 분리할 수 있다.
-- 부서번호를 입력받아 emp테이블에서 사원정보를 조회
-- 조회 컬럼 : 사원번호, 사원명, 부서번호, 연봉을 조회
-- 단, 부서번호는 10, 20, 30만 사용할 수 있고, 해당 번호가 아니면
-- '부서번호는 10,20,30번 만 입력해 주세요' 를 출력

set serveroutput on
set verify off

	accept deptno prompt '부서번호 : '

declare
	type emp_rec is record(empno number, ename varchar(30), 
		deptno number, sal number);

  -- 레코드 변수선언
	er emp_rec;

	--부서번호
  d_no number := &deptno;

  --1. sys_refcursor선언 : 커서의 선언과 쿼리문을 분리할 수 있다.
  -- 형식 : 커서명 sys_refcursor
	emp_cur sys_refcursor;

begin

	if d_no in (10, 20, 30) then
	--2. open
	open emp_cur for
		select empno, ename, deptno, sal
		from  emp
		where deptno = d_no;

	--3. 인출
	loop
	 fetch emp_cur into er;

	 exit when( emp_cur%notfound);

	   dbms_output.put_line(er.empno||'/'||er.ename||'/'||er.deptno||'/'||er.sal);
	end loop;

	--4. 닫기
	close emp_cur;

	else
		dbms_output.put_line('부서번호는 10,20,30번 만 입력해 주세요');
	end if;

exception
	when invalid_cursor then
	dbms_output.put_line('잘못된 커서 연산');
when others then
	dbms_output.put_line('알수없는 예외'|| sqlerrm);

end;
/


