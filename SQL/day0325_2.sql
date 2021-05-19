drop table test_alter;

create table test_alter(
	num number, -- number ���� 22�ڸ����� ���尡��
  neam varchar2(30byte),
  age number(2),
	addr number
);

-- �÷��� ����
-- neam -> name���� ����
alter table test_alter rename column neam to name;

-- �÷��� �������� ����
-- addr�÷��� ���������� number -> varchar2(300) ����
-- ���ڵ尡 �����ϸ� ���ϵ����������� ũ�⸸ ����ǰ�,  ���ڵ尡
-- �������� ������ �������� ��ü�� ���氡��
alter table test_alter modify addr varchar2(300);

--���ڵ� ����
insert into test_alter(num, name, age, addr)
values(1,'�ڱ��',27,'����� ������ ���ﵿ');

select * from test_alter;
commit;

-- ���ڵ尡 �����ϸ� ���������� ������ �� ����.
alter table test_alter modify addr number;

-- age�� number(2) -> number(22)�� ����
alter table test_alter modify age number(22);

-- �÷�����
-- �����÷�����
alter table test_alter drop column age;


truncate table test_alter;
-- �÷��߰� ( �÷����� ��������� �߰��� �� �ִ�)
-- id�÷��߰�(pk)
alter table test_alter add id varchar2(20) constraint pk_test_alter
	primary key;

-- DD���� ���� ���������� �ο��� ��������� ��ȸ
select * from user_constraints
where table_name = 'TEST_ALTER';

-- �÷��� ������ ������ ��������� ������ �� �ִ�.
-- name varchar2(15)�� �ʼ��Է� ���༳��
alter table test_alter modify name varchar2(15) not null;

select * from test_alter;

-- ������׺���
-- PK�� Ȱ��ȭ �Ǿ� �����Ƿ� ���� id�� �߰��� �� ����.
insert into test_alter(id,name) values('kim','�����');

-- ��������� ��Ȱ��ȭ :
alter table test_alter disable constraint pk_test_alter;

select * from user_constraints
where table_name = 'TEST_ALTER';

insert into test_alter(id, name) values('kim','������');

-- ��������� Ȱ��ȭ ( ������׿� ����Ǵ� ���ڵ尡 �����ϸ� �������
-- Ȱ��ȭ�� ���� �ʴ´�)
delete from test_alter where name = '������';
commit;

alter table test_alter enable constraint pk_test_alter;

-- ������� ����
-- Primary key�� �����ϸ� not null�� �������� �ʴ´�.
-- DBA�� �ο��� ������׸����� ����
alter table test_alter drop constraint pk_test_alter;
-- �ڵ����� �ο��� ������׸����� ����
alter table test_alter drop constraint SYS_C007540;

-- ������� �߰�(���̺���� ������� ����)
-- id �÷��� PK���� �߰�
alter table test_alter add constraint pk_test_alter primary key(id);

select * from test_alter;





