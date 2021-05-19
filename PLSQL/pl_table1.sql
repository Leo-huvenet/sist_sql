-- table 사용
set serveroutput on

declare
 -- 1. 테이블선언) 문자열을 저장할 수 있는 테이블 선언
 	type name_tab is table of varchar2(30) index by binary_integer;
  type age_tab is table of number(30) index by binary_integer;

 -- 2. 선언된 테이블로 변수 선언.
 	names name_tab;
 	ages age_tab;


begin
	-- 3. 값 할당 변수명(인덱스) := 값;
	names(1) := '강인섭';
	names(2) := '곽범수';
	names(3) := '박기범';
	names(4) := '강호동';
	names(5) := '강감찬';
	names(6) := '박지성';

	dbms_output.put_line('테이블 방의 수 '||names.count);

	--4. 값 사용. 변수명(인덱스)
	--dbms_output.put_line( names(3));

	--'강'씨의 인원수를 출력해보세요.
	for i in 1..names.count loop
		if names(i) LIKE '강%' then
		dbms_output.put_line( names(i));
		end if;
	end loop;


	---------number로 구성된 테이블사용---------
	ages(1) := 26;
	ages(2) := 25;
	ages(3) := 27;
	ages(4) := 30;
	ages(5) := 24;

	-- 값 사용
	-- 모든 방의 값을 출력
	for i in 1..ages.count loop
		dbms_output.put_line(ages(i)||'살');
	end loop;





end;
/
