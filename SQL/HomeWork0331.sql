-- ����1
set serveroutput on
set verify off

accept empno prompt '�����ȣ �Է� : '
accept ename prompt '����� �Է� : '
accept job prompt '���� �Է� : '
accept mgr prompt '�Ŵ�����ȣ �Է� : '
accept sal prompt '���� �Է� : '

declare

	empno cp_emp3.empno%type := &empno;
	ename cp_emp3.ename%type := '&ename';
	job cp_emp3.job%type := '&job';
	mgr cp_emp3.mgr%type := &mgr;
	sal cp_emp3.sal%type := &sal;

	row_cnt number;
begin

	if empno not between 1000 and 2000 then
	   	empno := 999;
	end if;
		 	
	  if sal > 5000 then
	  		sal := 5000;
		end if;	
	  	
			if job not in('CLERK','SALESMAN','MANAGER','ANALYST','PRESIDENT') then
					job := 'CLERK';
    	end if;
    	
  
		insert into cp_emp3(empno,ename,job,mgr,sal) values(empno,ename,job,mgr,sal);
	

	row_cnt := sql%rowcount;

	if row_cnt = 1 then
	  dbms_output.put_line(sql%rowcount||'�� �߰�');
	  commit;
	end if;

end;
/
