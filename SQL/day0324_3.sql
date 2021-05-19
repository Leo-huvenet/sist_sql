-- unique 사용
-- 번호, 이름, 전화번호를 저장

-- 컬럼단위의 제약사항
create table unique_column(
	num number,
	name varchar2(30),
	phone varchar2(13) constraint uk_phone unique
);

truncate table unique_column;

-- 제약사항확인
select * from user_constraints;
-- 생성된 인덱스확인
select * from user_indexes;

-- 추가성공
insert into unique_column(num, name, phone)
values(1,'테스트','010-1234-5678');

-- 다른 전화번호가 입력
insert into unique_column(num, name, phone)
values(2,'테스트','010-1234-5679');

-- 전화번호에 null 입력(null 사용가능)
insert into unique_column(num, name, phone)
values(3,'테스트','');

insert into unique_column(num, name)
values(4,'테스트');

-- error
-- 같은 전화번호가 입력되면 에러
insert into unique_column(num, name, phone)
values(5,'이하늘','010-1234-5678');

select * from unique_column;

-- 테이블단위
create table unique_table(
	num number,
	name varchar2(30),
	email varchar2(50),
	card_num char(4),
	constraint uk_card_num unique(card_num),
	constraint uk_email unique(email)
);

-- 제약사항 조회
select * from user_constraints
where constraint_type = 'U';

select * from user_indexes
where table_name = 'UNIQUE_TABLE';


