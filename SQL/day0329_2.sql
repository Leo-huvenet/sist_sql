select * from dba_sys_privs
where grantee = 'SCOTT';

-- SCOTT������ �ó�� ���� �ο�
grant create synonym to scott;

-- scott������ �ó�� ���� ȸ��
revoke create synonym from scott;

-- �ó�Ի���
-- car_model ���̺��� 'cmo' ��� �̸��� synonym�� �ο�
create synonym  cmo for car_model;

-- synonym�� ��ȸ�ϴ� Data Dictionary
select * from user_synonyms;


-- synonym�� ���
select * from cmo;

-- �������̺�� ���
select * from car_model;

-- �ó�� ����
drop synonym cmo;

--- view ---
select * from user_views;

grant create view to scott;
revoke create view from scott;

select * from dba_sys_privs
where grantee = 'SCOTT';

-- �ܼ��� CP_EMO4���̺��� ����� �ܼ� �� ���� : ��� view_emp --
create view view_emp
as select * from cp_emp4;

select * from user_views;

-- view�� ����� ��ȸ
select * from view_emp;

-- ���� ���̺� ��ȸ
select * from cp_emp4;

-- �������̺� �۾����ϸ� view �ٷ� �ݿ��ȴ�.
insert into cp_emp4(empno, ename, deptno, job, hiredate)
values (1234, '�ڱ��', 10, '���', sysdate);

update cp_emp4
set deptno = 20, job = '�븮'
where empno=1234;

delete from cp_emp4 where empno = 1234;

select * from view_emp;

-- �ܼ� View �۾�
-- insert
insert into view_emp(empno, ename, deptno, job, hiredate)
values (1234, '�ڱ��', 10, '���', sysdate);

-- update
update view_emp
set deptno = 20, job = '�븮'
where empno=1234;

-- delete
delete from view_emp where empno = 1234;

-- ���� ���̺� ��ȸ
select * from cp_emp4;

-- view ����
drop view view_emp;

select * from user_views;

-- ���պ� : �������� ���̺�� ����� ��
create table cp_dept as select * from dept;
-- cp_dept���̺��� �μ���ȣ PK����
alter table cp_dept add constraint pk_cp_dept primary key(deptno);
-- cp_emp4���̺��� deptno�÷��� FK�� ����
alter table cp_emp4 add constraint fk_cp_emp4_deptno
		foreign key(deptno) references cp_dept(deptno) on delete cascade;

select * from user_constraints
where table_name in('CP_DEPT','CP_EMP4');

CREATE VIEW EMP_DATA AS
SELECT CD.DEPTNO, DNAME, LOC, EMPNO, ENAME, JOB, HIREDATE
FROM CP_DEPT CD, CP_eMP4 CE4
WHERE CE4.DEPTNO(+) = CD.DEPTNO;

SELECT * FROM USER_VIEWS;

--VIEW�� ��ȸ : �ܼ� ������ join�� ����� ����� �� �ִ�.
SELECT * FROM EMP_DATA;

select doptno, dname, empno, job
from emp_Data
where deptno in (30,20);

--�������̺� �μ����� �߰�
insert into cp_dept(deptno, dname, loc) values(50,'���ߺ�','����');
commit;

insert into cp_emp4(EMPNO, ENAME, DEPTNO, JOB, HIREDATE)
values(1111,'������',50,'�븮',sysdate);

-- view��ȸ : �߰��� ������ view�� �ٷ� �ݿ�
select * from emp_data;

-- ���պ信 insert, update, delete �۾�����
-- insert x
insert into emp_data(deptno, dname, loc, empno, ename, job, hiredate)
values ( 60, '��������','�뱸',1212,'�����','����',sysdate);

-- update x
update emp_data
set job = '��ǥ'
where empno = 1111;

-- delete x
delete from emp_data where empno = 1111;

-- view drop
drop view emp_Data;


