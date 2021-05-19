-- 0414 가데이터 추가

create table injection_test(
	id varchar2(20) constraint pk_injection_test primary key,
	pass varchar2(30) not null,
	name varchar2(30) not null
);

insert into injection_test values('kim','1234','김덕영');
insert into injection_test values('park','1234','박기범');
insert into injection_test values('jin','1234','진재혁');

select * from INJECTION_TEST;

commit;