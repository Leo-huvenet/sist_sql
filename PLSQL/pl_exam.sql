set serveroutput on
-- 주민번호를 입력받아 유효성을 출력하는 PL/SQL 작성
/*
	1. 주민번호는 14자리이여야한다. (14자리가 아니면 '자릿수를 확인'를 출력)
	2. 주민번호는 '880101-1234567' 형식으로 7번째 자리에 '-' 있어야한다.
		 (7번째 자리가 '-'이 아니면 '형식을 확인'을 출력)
	1번과 2번조건에 부합되면 연산을 수행한다.
	3. 주민번호 구하기
		880101-1234567
		3-1 각자리에 2,3,4,5,6,7,8,9,2,3,4,5를 곱한 값을 더한다.
		3-2 3-1에서 발생값을 11로 나눈 나머지를 구한다.
		3-3 11에서 3-2의 발생한 값을 뺀다.
		3-4 3-3에서 발생한 값을 10로 나눈나머지를 구한다.
		3-5 3-4에서 발생한 값이 주민번호의 가장 마지막자리와 같다면 '유효'
				그렇지 않다면 '무효'를 출력.
*/
set verify off

accept rsn prompt '주민번호 입력 : '

declare
	rsn varchar2(30) := '&rsn';
	rsn_sum number := 0;
	rsn_flag number := 2;
	
begin

	if length(rsn) != 14 then
		
		dbms_output.put_line('자릿수를 확인');
	elsif(instr(rsn, '-') != 7) then
		dbms_output.put_line('형식을 확인');
	else
		for i in 1..length(rsn)-1 loop
			if i != 7 then
				rsn_sum := rsn_sum + substr(rsn,i,1) * rsn_flag;
				rsn_flag := rsn_flag+1;

				if rsn_flag = 10 then
					rsn_flag := 2;
				end if;

			end if;
		end loop;
    
			if substr(rsn,14,1) = mod(11 - mod(rsn_sum,11),10) then
				dbms_output.put_line('유효');
			else
				dbms_output.put_line('무효');
			end if;
  end if;
end;
/
