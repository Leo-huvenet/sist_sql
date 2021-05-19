-- 1~100까지 반복출력하는 while
set serveroutput on

declare

	i number;
begin

	i := 1; -- 초기값

	while i < 11 loop -- 조건식
		dbms_output.put( i||' ' );
		i := i+1; --증.감소식
	end loop;

	dbms_output.put_line(' ');

	-- 1 ~ 100까지 출력하는데 1 2 짝 4 5 짝 7 8 짝 의 형식으로 출력

	i := 0; -- 초기값

	while i < 101 loop -- 조건식
		if mod(i,3) = 0 then
			dbms_output.put('짝  ');
		else
		  dbms_output.put( i||' ');
		end if;
		i := i+1; --증.감소식
	end loop;

	dbms_output.put_line(' ');
end;
/
