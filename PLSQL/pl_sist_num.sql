-- 시퀀스를 사용하여 고정길이의 증가하는 숫자형식 문자열 반환하는 함수
-- 키로 사용하는 경우
-- SIST_0000000001 의 형식으로 반환되어야한다.

create or replace function sist_num -- 매개변수 소괄호는 매개변수가 있을 때만 사용
return char
is
	temp_num varchar2(15);
begin

	temp_num := concat('SIST',lpad(seq_func.nextval,10,0));

	return temp_num;
end;
/




