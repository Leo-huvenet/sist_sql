-- 두개의 수를 입력받아 둘 중 큰 수를 반환하는 함수
create or replace function high( num1 number, num2 number)
return number
is
	high_num number;
begin

	if num1 < num2 then
	 high_num := num2;
	elsif num1 > num2 then
	 high_num := num1;
	end if;

	return high_num;
end;
/
