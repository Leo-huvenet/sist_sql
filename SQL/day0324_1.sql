-- 컬럼단위 제약사항 Primary key를 설정
-- 이름, 전화번호, 아이디를 정장하는 테이블 생성

-- 컬럼명 데이터형(크기) primary key - 제약사항명이 자동으로 생성
-- SYS_C007503, 제약사항명으로 어떤 제약을 위배하였는지 알 수 없다.
drop table primary_column;

create table primary_column(
 	name varchar2(20),
 	phone varchar2(13),
 	id varchar2(20) constraint pk_primary_column primary key
);

-- 제약사항을 조회
select *
from user_constraints
where table_name = 'PRIMARY_COLUMN';


-- 추가성공
-- 최초입력
insert into primary_column(name,phone,id) values ('한상민', '010-1234-5678','han');
-- ID가 다를 때
insert into primary_column(name,phone,id) values ('한상민', '010-1234-5678','han1');

-- 추가실패

-- NULL이 입력될 때 --

-- 컬럼명이 생략되는 경우
insert into primary_column(name,phone) values ('한상민', '010-1234-5678');

--''가 입력되는경우
insert into primary_column(name,phone,id) values ('한상민', '010-1234-5678','');

-- 같은 값이 입력되는 경우 무결성 제약조건 위배
insert into primary_column(name,phone,id) values ('이상철', '010-2222-3333','han1');

select * from PRIMARY_COLUMN;

-- 테이블단위 제약사항
-- 컬럼의 정의와 제약사항의 정의를 분리하여 작성할 수 있다.
CREATE TABLE PRIMARY_TABLE(
	name varchar2(20),
 	phone varchar2(13),
 	id varchar2(20),
 	constraint pk_primary_table primary key(id)
);

--추가성공
insert into primary_table(name, phone, id) values ('진재혁', '010-1234-4321', 'jin');

select * from PRIMARY_TABLE;


---- 여러개의 컬럼이 하나의 PK로 구성
-- 아이템번호, 아이템명, 생산일자, 설명
-- ( 아이템은 하루에 한번만 생산가능 )
DROP TABLE PRIMARY_MULTI;

CREATE TABLE PRIMARY_MULTI(
	ITEM_NUM NUMBER(4),
	NAME VARCHAR2(60),
	ITEM_DATE CHAR(8),
	ITEM_INFO CLOB,
	CONSTRAINT PK_PRIMARY_MLTI PRIMARY KEY(ITEM_NUM, ITEM_DATE)
);

ALTER TABLE PRIMARY_MULTI RENAME COLUMN ITEM_INFO TO ITEM_INFO;
SELECT * FROM USER_CONSTRAINTS
WHERE TABLE_NAME = 'PRIMARY_MULTI';

DELETE FROM PRIMARY_MULTI;

-- 추가성공
-- 최초데이터입력
INSERT INTO PRIMARY_MULTI(ITEM_NUM,NAME,ITEM_DATE,ITEM_INFO)
VALUES( 1000, '키보드', '20210302',
'멤브레인 방식으로 저렴이 키보드. 반발력이 떨어짐');

INSERT INTO PRIMARY_MULTI(ITEM_NUM,NAME,ITEM_DATE,ITEM_INFO)
VALUES( 1000, '키보드', '20210303',
'멤브레인 방식으로 저렴이 키보드. 반발력이 떨어짐');
-- 아이템 번호와 날짜가 다르면 입력가능
INSERT INTO PRIMARY_MULTI(ITEM_NUM,NAME,ITEM_DATE,ITEM_INFO)
VALUES( 1001, '키보드', '20210301',
'기계식 키보드로 청축, 흑축, 적축,갈축이 있으며, 취향에따라 원하는 키를 선택할 수 있다.');

-- 에러
-- 아이템번호와 생산일자가 같은 경우
INSERT INTO PRIMARY_MULTI(ITEM_NUM,NAME,ITEM_DATE,ITEM_INFO)
VALUES( 1001, '마우스', '20210301',
'손목을 보고하기위해 손의 각도를 계산하여 제작한 제품으로 어짜피 insert 안됨');

 -- null이 입력되면 error
 INSERT INTO PRIMARY_MULTI(NAME,ITEM_DATE,ITEM_INFO)
VALUES('마우스', '20210303',
'멤브레인 방식으로 저렴이 키보드. 반발력이 떨어짐');

INSERT INTO PRIMARY_MULTI(ITEM_NUM,NAME,ITEM_DATE,ITEM_INFO)
VALUES( 1000, '키보드', '',
'멤브레인 방식으로 저렴이 키보드. 반발력이 떨어짐');

-- primary key를 설정하면 unique index가 자동생성
-- index를 확인하는 Data Dictionary는 user_indexes
select * from user_indexes;
















