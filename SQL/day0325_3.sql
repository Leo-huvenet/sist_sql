-- ��������


-- ��������
-- oracle 12c���ʹ� ������ �տ� ##�� �پ ���������.
-- ##�� ������� �ʴ� ������ �����Ϸ��� _ORACLE_SCRIPT�� ����ϸ� �ȴ�.
alter session set "_ORACLE_SCRIPT"=true;

create user rkw identified by 1234;

-- ������ ���������� Ȯ���ϴ� Data Dictionary
select * from dba_users;

-- ������ ������ ���� �ο�
-- ���ӱ��� : connect, ���̺������ : resource, DBA���� : dba
-- ��������� : create view, �ó�� �������� : create synonym ,,,

-- ���Ѻο� : grant,,, to ������;
-- ���ӱ���
grant connect to rkw;

-- tablespace ������ : table����, ��밡�� Oracle 11g
grant resource to rkw;

-- Ư�� tablespace�� ��뼳�� Oracle 12c~
alter user rkw default tablespace users quota unlimited on users;

-- ������ �ο��� ���� ��ȸ : dba_role_privs
select * from dba_role_privs
where grantee = 'RKW';

-- ����ȸ��
-- ������ ������ ���ӱ��� ȸ��
revoke connect from rkw;

-- ���� ��ױ�
select * from dba_users
where username='RKW';

alter user rkw account lock;
alter user rkw account unlock;

-- ���� ����
drop user rkw cascade;




