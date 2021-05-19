
-- Homework0401_1의 선생님 풀이

set serveroutput on
set verify off

accept mgr prompt '매니저 번호 입력 : '

declare
	-- 사원번호, 사원명, 부서번호, 입사일, 연봉
	type emp_rec is record(EMPNO emp.empno%type, ENAME emp.ename%type, DEPTNO emp.deptno%type,
												 HIREDATE emp.hiredate%type, SAL emp.sal%type);
	-- 조회된 레코드를 저장할 수 있는 table를 선언 (방하나가 조회된 행하나를 저장)
	type data_tab is table of emp_rec index by binary_integer;

	-- 방하나가 조회된 행하나를 저장할 수 있는 emp_table을 사용하여 table 변수를 선언
	emp_data data_tab;
	-- record변수 선언
	ed emp_rec;

--	EMPNO emp.empno%type;
--	ENAME emp.ename%type;
--	DEPTNO emp.deptno%type;
--	HIREDATE emp.hiredate%type;
--	SAL emp.sal%type;

	-- 인덱스용
	idx number := 0;

	-- 부서명 저장용
	dname varchar(30);

	-- 1. 커서선언
	cursor cur_emp is
	select empno, ename, deptno, hiredate, sal
	from emp
	where mgr = &mgr;

begin
---------------------데이터 처리시작---------------------------------
	-- 2. 커서열기
	if cur_emp%isopen then
		close cur_emp;
	end if;

	open cur_emp;

	-- 3. 인출 : 인출된 레코드를 table의 방에 담는다.
	loop
		idx := idx+1;
		fetch cur_emp into emp_data(idx);
	  exit when(cur_emp%notfound);


	end loop;

	-- 4. 커서닫기
	close cur_emp;
------------------------데이터 처리끝-------------------------------

------------------------뷰 처리시작-------------------------------
	 if idx = 1 then
	 	dbms_output.put_line(&mgr||'매니저는 관리하는 사원이 없거나, 매니저가 아닙니다.')
	 end if;

	 for i in 1 ..emp_data.count loop
			ed := emp_data(i);

	 	  if ed.deptno = 10 then
	     dname := '개발부';
	  	elsif ed.deptno = 20 then
	     dname := '유지보수부';
	  	elsif ed.deptno = 30 then
	     dname := '영업부';
	  	else
	  	 dname := '기술지원';
	  	end if;

	  dbms_output.put_line(ed.empno||','||ed.ename||','||ed.deptno||','||dname||
				','||ed.hiredate||','||ed.sal);
	  -- decode 함수는 SQL에서만 사용할 수 있다.
	  -- 그러므로 PL/SQL에서는 if문을 이용한다.

	 end loop;
------------------------뷰 처리끝-------------------------------

exception
when invalid_cursor then
dbms_output.put_line('커서가 잘못된 연산을 수행하였습니다.');
when others then
dbms_output.put_line('개발자가 인지하지못한 예외 : '||sqlerrm);

end;
/

