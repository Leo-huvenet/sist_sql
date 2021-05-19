SELECT * FROM DEPT;
SELECT * FROM zipcode;


-- 숙제1
drop table WORK_0324;

CREATE TABLE WORK_0324 (
	num number,
	ID VARCHAR2(10),
	NAME varchar2(30),
	AGE NUMBER,
	R_DEPTNO number(2),
	phone varchar2(13) ,
	zipcode varchar2(20),
	address varchar2(60),
	CONSTRAINT PK_ID PRIMARY KEY(ID),
	CONSTRAINT FK_DEPTNUM FOREIGN KEY(R_DEPTNO) REFERENCES DEPT(DEPTNO) on delete cascade,
	CONSTRAINT UK_zipcode UNIQUE(zipcode)
);

select * from WORK_0324;

-- 숙제2

--PRIMARY KEY -  null을 허용하지 않으면서 유일
insert into work_0324(num, id, name, age, r_deptno, phone, zipcode, ADDRESS)
values (1,'hong','홍길동',34,20,'010-1234-5678','135-554','서울');

insert into work_0324(num, id, name, age, r_deptno, phone, zipcode, ADDRESS)
values (1,'','홍길동',34,20,'010-1234-5678','135-554','서울'); -- null값이므로 만족x

insert into work_0324(num, id, name, age, r_deptno, phone, zipcode, ADDRESS)
values (2,'hong','이순신',44,10,'010-1234-4321','145-554','양주'); -- 유일(unique)하지않음

--FOREIGN KEY 
-- null허용, 다른 테이블(부모테이블)에 존재하는 값만 이용가능
-- 참조하는 컬럼의 값을 가진 테이블(부모테이블)은 자식테이블의 참조하는 레코드가 존재하면  
-- 삭제되지 않는다(on delete cascade를 이용하여 연쇄삭제가능)

insert into work_0324(num, id, name, age, r_deptno, phone, zipcode, ADDRESS)
values (1,'jang','장영실',34, 50,'010-1234-5678','131-544','서울'); -- 다른 테이블(부모테이블)에 존재하는 값이 아닌 값이므로 만족x

--UNIQUE - null허용, 값이 존재하면서 유일해야 할 때
insert into work_0324(num, id, name, age, r_deptno, phone, zipcode, ADDRESS)
values (1,'jong','세종대왕',34,40,'010-1234-5678','135-554','서울'); -- zipcode값이 유일하지 않음


