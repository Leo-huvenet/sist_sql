-- ����2
create or replace procedure proc_emp3(empno number, ename varchar2, job varchar2, sal number,
	 row_cnt out number, msg out varchar)
is
	 i_empno number(6) := empno;
	 i_sal number(6) := sal;
	 i_job varchar(30) := job;


begin

	 if i_empno not between 1 and 9999 then
	 			i_empno := 9999;
	 end if;
	 			
	 		if i_sal not between 2400 and 3000 then
			  	i_sal := 2400;
			end if; 	
			
				if i_job not in('CLERK','SALESMAN','MANAGER','ANALYST','PRESIDENT') then
						i_job := 'CLERK';
				end if;
			
	 
	insert into cp_emp3(empno, ename, job, hiredate, sal) values( i_empno, ename, i_job, sysdate, i_sal);
	 

	 row_cnt := sql%rowcount;

	 if row_cnt = 1 then
			msg := ename||'���('||i_empno||') '||i_sal||'������ �Ի�';
	 		commit;
	 else
	    msg := ename||'��� �Է½���';
	 end if;

	 exception
	 when dup_val_on_index then
	    msg := empno||'�� �����ȣ�� �̹� �����!!!!!!';
	 when others then
	 		msg := '������� �߰� �۾� �� �����߻�!!!!!!';

end;
