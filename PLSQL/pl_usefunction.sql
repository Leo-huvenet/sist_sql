select * from user_procedures
where object_type='FUNCTION';

-- 간접실행
--select plus(1,2)
--from dual;
--
--select high(4,9)
--from dual;

-- 1에서부터999999999999 까지 1씩 증가하는 시퀀스 생성
create sequence seq_func
increment by 1
start with 1
maxvalue 999999999999
cache 25
nocycle;

select * from user_sequences;

-- 매개변수가 없는 함수는 호출할 때 함수명만 쓴다
select sist_num
from dual;

-- 코드값을 반환하는 함수는 insert할 때 주로 사용한다.
create table function_insert(
num char(15) constraint pk_function_insert primary key,
name varchar2(15)
);

--function에 () 넣고 테스트
insert into function_insert(num,name) values ( sist_num(), '강인섭');
--function에 () 빼고 테스트
insert into function_insert(num,name) values ( sist_num, '조혜원');

select * from function_insert;

-- 함수삭제
drop function plus;
drop function high;

select chk_ssn('981103-1331229')
from dual;

-- 난수뽑기 : 패키지를 사용한 함수 DBMS_RANDOM.value(시작,갯수)

select trunc(dbms_random.value(1,10),0) random1,
 trunc(dbms_random.value(100000,999999),0) random2
from dual;

select create_ssn(981103,1) ssn
from dual;
