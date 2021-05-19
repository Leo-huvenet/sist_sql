select * from dba_sys_privs
where grantee = 'SCOTT';

-- SCOTT계정에 시노님 권한 부여
grant create synonym to scott;

-- scott계정에 시노님 권한 회수
revoke create synonym from scott;

-- 시노님생성
-- car_model 테이블을 'cmo' 라는 이름의 synonym을 부여
create synonym  cmo for car_model;

-- synonym을 조회하는 Data Dictionary
select * from user_synonyms;


-- synonym명 사용
select * from cmo;

-- 실제테이블명 사용
select * from car_model;

-- 시노님 삭제
drop synonym cmo;

--- view ---
select * from user_views;

grant create view to scott;
revoke create view from scott;

select * from dba_sys_privs
where grantee = 'SCOTT';

-- 단순뷰 CP_EMO4테이블을 사용한 단순 뷰 생성 : 뷰명 view_emp --
create view view_emp
as select * from cp_emp4;

select * from user_views;

-- view를 사용한 조회
select * from view_emp;

-- 실제 테이블 조회
select * from cp_emp4;

-- 실제테이블에 작업을하면 view 바로 반영된다.
insert into cp_emp4(empno, ename, deptno, job, hiredate)
values (1234, '박기범', 10, '사원', sysdate);

update cp_emp4
set deptno = 20, job = '대리'
where empno=1234;

delete from cp_emp4 where empno = 1234;

select * from view_emp;

-- 단순 View 작업
-- insert
insert into view_emp(empno, ename, deptno, job, hiredate)
values (1234, '박기범', 10, '사원', sysdate);

-- update
update view_emp
set deptno = 20, job = '대리'
where empno=1234;

-- delete
delete from view_emp where empno = 1234;

-- 실제 테이블 조회
select * from cp_emp4;

-- view 삭제
drop view view_emp;

select * from user_views;

-- 복합뷰 : 여러개의 테이블로 도출된 뷰
create table cp_dept as select * from dept;
-- cp_dept테이블의 부서번호 PK설정
alter table cp_dept add constraint pk_cp_dept primary key(deptno);
-- cp_emp4테이블의 deptno컬럼에 FK를 설정
alter table cp_emp4 add constraint fk_cp_emp4_deptno
		foreign key(deptno) references cp_dept(deptno) on delete cascade;

select * from user_constraints
where table_name in('CP_DEPT','CP_EMP4');

CREATE VIEW EMP_DATA AS
SELECT CD.DEPTNO, DNAME, LOC, EMPNO, ENAME, JOB, HIREDATE
FROM CP_DEPT CD, CP_eMP4 CE4
WHERE CE4.DEPTNO(+) = CD.DEPTNO;

SELECT * FROM USER_VIEWS;

--VIEW의 조회 : 단순 쿼리로 join의 결과를 사용할 수 있다.
SELECT * FROM EMP_DATA;

select doptno, dname, empno, job
from emp_Data
where deptno in (30,20);

--실제테이블에 부서정보 추가
insert into cp_dept(deptno, dname, loc) values(50,'개발부','서울');
commit;

insert into cp_emp4(EMPNO, ENAME, DEPTNO, JOB, HIREDATE)
values(1111,'곽범수',50,'대리',sysdate);

-- view조회 : 추가된 정보는 view에 바로 반영
select * from emp_data;

-- 복합뷰에 insert, update, delete 작업수행
-- insert x
insert into emp_data(deptno, dname, loc, empno, ename, job, hiredate)
values ( 60, '유지보수','대구',1212,'김덕영','사장',sysdate);

-- update x
update emp_data
set job = '대표'
where empno = 1111;

-- delete x
delete from emp_data where empno = 1111;

-- view drop
drop view emp_Data;


