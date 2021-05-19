-- 지번주소를 저장하는 테이블 생성
-- 우편번호,시도,구군,동,번지,seq로 이루어져있다.
create table zipcode(
	zipcode char(7),
	sido char(6),
	gugun varchar2(25),
	dong varchar2(300),
	bunji varchar2(25),
	seq number(5)
);

truncate table zipcode;

select count(*) from zipcode;

--동이름으로 우편번호 검색
select ZIPCODE, SIDO, GUGUN, DONG, BUNJI
from zipcode
where DONG like '%삼성동%';
