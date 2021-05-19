-- loop 사용 : 최소 1번 수행 최대 조건까지 반복해야할 때
set serveroutput on

declare
	i number;
begin

	i := 1;

loop
		dbms_output.put_line(i||' ');
	--탈출조건을 설정하지 않으면 무한 Loop로 동작
	exit when(i = 5 );
	i := i+1;
	end loop;

end;
/
