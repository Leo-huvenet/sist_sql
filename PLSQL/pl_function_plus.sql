 -- 두개의 수를 입력받아 더한값을 반환하는 함수작성
create or replace function plus( num1 number, num2 number)
return number
is

begin



 	return num1+num2;
end;
/
