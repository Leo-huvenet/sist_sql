-- 사원번호, 사원명, 부서번호, 직무를 입력받아 CP_EMP4테이블에 레코드를 삽입하는
-- Procedure 생성

create or replace procedure proc_insert(empno cp_emp4.empno%type,
	 ename cp_emp4.ename%type, deptno cp_emp4.deptno%type, job cp_emp4.job%type,
	 row_cnt out number, msg out varchar)
	 is


	 begin

	 insert into cp_emp4(empno, ename, deptno, job, hiredate)
	 values( empno, ename, deptno, job, sysdate );

	 --insert 한 행의 수
	 row_cnt := sql%rowcount;

	 if row_cnt = 1 then
			msg := empno||'번 사원 정보가 추가되었습니다.';
	 		commit;
	 end if;

	 exception
	 when dup_val_on_index then
	    msg := empno||'번 사원번호는 사용중입니다.';
	 when others then
	 		msg := '사원정보 추가 작업 중 문제발생';

	 end;

