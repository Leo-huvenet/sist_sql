-- 1~100까지 반복하는 for
set serveroutput on

declare
	j number;
	total number :=0 ;
	msg varchar(30) ;
begin

	for i in 1 .. 100 loop
		dbms_output.put(i||' ');
	end loop;

	dbms_output.put_line(' ');

	for j1 in 0 .. 10 loop
		j := j1;
		dbms_output.put(j||' ');
	end loop;

  dbms_output.put_line('----'||j||' ');

  -- 1~ 100까지 짝수만 출력
  for i in 1 .. 100 loop
 		if mod(i,2) = 0 then
 			dbms_output.put(i||' ');
 		end if;
 		total := total + 1;
  end loop;

  dbms_output.put_line(' ');

  -- 1~100까지 합 출력
  dbms_output.put_line(total);

  msg := 'java Oracle';

  -- msg에 담겨진 문자열을 한글자씩 잘라서 출력
	for i in 1 .. length(msg) loop
	  dbms_output.put_line(substr(msg,i,1)||' ');
	end loop;

	dbms_output.put_line(' ');

	-- 반복문 빠져나가기
	for i in 1 .. 100 loop
		dbms_output.put_line(i);

--		if i = 10 then
--		exit;
--		end if;
		exit when ( i = 10 );
	end loop;
	
	

end;
/
