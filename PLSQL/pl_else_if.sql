-- 점수를 입력받아 점수에대한 판정
-- 점수가 0보다작다면 '0보다작아서 실패', 점수가 100보다 크다면 '100보다 커서실패'
-- 그렇지 않으면 '입력성공'을 출력하는 PL/SQL작성

set serveroutput on
set verify off

accept score prompt '점수입력 : '
accept brith prompt '태어난해 입력 : '

declare

score number := &score;
brith number := 0;
flag number;
zodiac varchar2(9) ;


begin

dbms_output.put_line(score||'점');

if score < 0 then
	dbms_output.put_line('은 0보다 작을 수 없습니다.');
else if score > 100 then
	dbms_output.put_line('은 100보다 클 수 없습니다.');
else
	dbms_output.put_line('입력성공 하였습니다.');
end if;

-- 입력값이 1890 ~ 2021년 사이인 경우 변수에 할당하고, 그렇지 않으면
-- '띠를 계산하지 않는 년도입니다.'를 보여준다.

-- 변수에 할당된 경우 띠를 구하여 출력
-- 원숭이-0, 닭-1, 개-2, 돼지-3, 쥐-4, 소-5, 호랑이-6, 토끼-7, 용-8, 뱀-9, 말-10, 양-11

	if &birth between 1890 and 2021 then
			 brith := &brith ;
		else
			dbms_output_put_line('띠를 계산하지 않는 년도입니다.');
		end if;

	   if brith != 0 then
      flag := mod(brith, 12);

         if flag = 0 then
            zodiac := '원숭이';

         elsif   flag = 1 then
            zodiac := '닭';

         elsif   flag = 2 then
            zodiac := '개';

         elsif   flag = 3 then
            zodiac := '돼지';

         elsif   flag = 4 then
            zodiac := '쥐';

         elsif   flag = 5 then
            zodiac := '소';

         elsif   flag = 6 then
            zodiac := '호랑이';

         elsif   flag = 7 then
            zodiac := '토끼';

         elsif   flag = 8 then
            zodiac := '용';

         elsif   flag = 9 then
            zodiac := '뱀';

         elsif   flag = 10 then
            zodiac := '말';

         else
            zodiac := '양';

       end if;

      dbms_output.put_line(zodiac);

   end if;

end;
/
