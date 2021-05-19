-- 이름, 태어난해를 입력받아, print output을 하면 '홍길동님 태어난해 2021년
-- 띠는 xx띠'를 출력하는 PL/SQL을 작성


create or replace procedure proc_zodiac2(name varchar2, birth number,
	output_msg out varchar2)
	is

		ani_num number;
	  ani varchar(30);

	begin

	  ani_num := mod(birth,12);
		if ani_num = 0 then
		ani := '원숭이';
		elsif ani_num = 1 then
		ani := '닭';
		elsif ani_num = 2 then
		ani := '개';
		elsif ani_num = 3 then
		ani := '돼지';
		elsif ani_num = 4 then
		ani := '쥐';
		elsif ani_num = 5 then
		ani := '소';
		elsif ani_num = 6 then
		ani := '호랑이';
		elsif ani_num = 7 then
		ani := '토끼';
		elsif ani_num = 8 then
		ani := '용';
		elsif ani_num = 9 then
		ani := '뱀';
		elsif ani_num = 10 then
		ani := '말';
		elsif ani_num = 11 then
		ani := '양';
		end if;

		output_msg := name||'님 태어난해 '||birth||'년 띠는 '||ani||'띠';

end;
/
