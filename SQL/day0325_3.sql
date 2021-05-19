-- 계정관리


-- 계정생성
-- oracle 12c부터는 계정명 앞에 ##이 붙어서 만들어진다.
-- ##을 사용하지 않는 계정을 생성하려면 _ORACLE_SCRIPT를 사용하면 된다.
alter session set "_ORACLE_SCRIPT"=true;

create user rkw identified by 1234;

-- 생성된 계정정보를 확인하는 Data Dictionary
select * from dba_users;

-- 생성된 계정에 권한 부여
-- 접속권한 : connect, 테이블사용권한 : resource, DBA권한 : dba
-- 뷰생성권한 : create view, 시노님 생성권한 : create synonym ,,,

-- 권한부여 : grant,,, to 계정명;
-- 접속권한
grant connect to rkw;

-- tablespace 사용권한 : table생성, 사용가능 Oracle 11g
grant resource to rkw;

-- 특정 tablespace의 사용설정 Oracle 12c~
alter user rkw default tablespace users quota unlimited on users;

-- 계정에 부여된 권한 조회 : dba_role_privs
select * from dba_role_privs
where grantee = 'RKW';

-- 권한회수
-- 생성된 계정에 접속권한 회수
revoke connect from rkw;

-- 계정 잠그기
select * from dba_users
where username='RKW';

alter user rkw account lock;
alter user rkw account unlock;

-- 계정 삭제
drop user rkw cascade;




