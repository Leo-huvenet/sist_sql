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
	data data_tab;

	EMPNO emp.empno%type;
	ENAME emp.ename%type;
	DEPTNO emp.deptno%type;
	HIREDATE emp.hiredate%type;
	SAL emp.sal%type;

	-- 조회된 행의 수를 저장하기위한 변수
	cnt number := 1;
  str varchar2(500) ;
	-- 1. 커서선언
	cursor cur_emp is
	select empno, ename, deptno, hiredate, sal
	from emp
	where mgr = &mgr;

begin
	-- 2. 커서열기
	if cur_emp%isopen then
		close cur_emp;
	end if;

	open cur_emp;

	-- 3. 인출 : 인출된 레코드를 table의 방에 담는다.
	loop
    fetch cur_emp into empno, ename, deptno, hiredate, sal;

		exit when(cur_emp%notfound);

		str := (empno||','||ename||','||deptno||','||hiredate||','||sal);

    data(cnt).empno := substr(str,1,instr(str,',',1,1)-1);
		data(cnt).ename := substr(str,instr(str,',',1,1)+1,instr(str,',',1,2)-instr(str,',',1,1)-1);
		data(cnt).deptno := substr(str,instr(str,',',1,2)+1,instr(str,',',1,3)-instr(str,',',1,2)-1);
		data(cnt).hiredate := substr(str,instr(str,',',1,3)+1,instr(str,',',1,4)-instr(str,',',1,3)-1);
		data(cnt).sal := substr(str,instr(str,',',1,4)+1);

	   cnt := cnt + 1;

	end loop;

	dbms_output.put_line(data.count||'개');

	for i in 1..data.count loop
		if data(i).deptno = 10 then
		dbms_output.put_line(data(i).empno||', '||data(i).ename||', 개발부, '||
												 data(i).hiredate||', '||data(i).sal);
		elsif data(i).deptno = 20 then
		dbms_output.put_line(data(i).empno||', '||data(i).ename||', 유지보수부, '||
												 data(i).hiredate||', '||data(i).sal);
		elsif data(i).deptno = 30 then
		dbms_output.put_line(data(i).empno||', '||data(i).ename||', 영업부, '||
												 data(i).hiredate||', '||data(i).sal);
	  else
		dbms_output.put_line(data(i).empno||', '||data(i).ename||', 기술지원부, '||
												 data(i).hiredate||', '||data(i).sal);
	  end if;

	end loop;

  close cur_emp;

end;
/
