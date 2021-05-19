-- 태어난해를 변수에 저장하고, 변수를 사용하여 나이구하기
-- 현재년도 - 태어난해 + 1 = 나이
set serveroutput on

declare
	 -- 변수의 선언
   birth_year char(4);
   now_year char(4);
begin
	 -- 값 할당
	 birth_year := 1998;
	 now_year := to_char(sysdate, 'yyyy');

	 dbms_output.put_line('태어난해'|| birth_year || '년 나이 '||
	 								(now_year - birth_year + 1)|| '살');

	 -- Error : 관계연산자는 출력할 수 없다.
	 dbms_output.put_line(3>2);
end;
/
