-- 방하나에 번호와 이름을 저장할 수 있는 테이블 생성.
set serveroutput on

declare
	-- record 선언
	type data_rec is record ( num number, name varchar2(30) );
	-- record를 사용하여 테이블 선언
	type data_tab is table of data_rec index by binary_integer;
	-- table을 사용하여 변수 선언
	data data_tab;

begin

	-- 값할당
	data(1).num := 1;
 	data(1).name := '강인섭';
	

	data(2).num := 2;
	data(2).name := '곽범수';

	data(3).num := 3;
	data(3).name := '박기범';

	dbms_output.put_line(data.count||'개');
	-- 모든 방의 값 출력

	for i in 1..data.count loop
		dbms_output.put_line('번호 : '||data(i).num||', 이름 : '||data(i).name);
	end loop;

end;
/
