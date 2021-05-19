-- �÷����� ������� Primary key�� ����
-- �̸�, ��ȭ��ȣ, ���̵� �����ϴ� ���̺� ����

-- �÷��� ��������(ũ��) primary key - ������׸��� �ڵ����� ����
-- SYS_C007503, ������׸����� � ������ �����Ͽ����� �� �� ����.
drop table primary_column;

create table primary_column(
 	name varchar2(20),
 	phone varchar2(13),
 	id varchar2(20) constraint pk_primary_column primary key
);

-- ��������� ��ȸ
select *
from user_constraints
where table_name = 'PRIMARY_COLUMN';


-- �߰�����
-- �����Է�
insert into primary_column(name,phone,id) values ('�ѻ��', '010-1234-5678','han');
-- ID�� �ٸ� ��
insert into primary_column(name,phone,id) values ('�ѻ��', '010-1234-5678','han1');

-- �߰�����

-- NULL�� �Էµ� �� --

-- �÷����� �����Ǵ� ���
insert into primary_column(name,phone) values ('�ѻ��', '010-1234-5678');

--''�� �ԷµǴ°��
insert into primary_column(name,phone,id) values ('�ѻ��', '010-1234-5678','');

-- ���� ���� �ԷµǴ� ��� ���Ἲ �������� ����
insert into primary_column(name,phone,id) values ('�̻�ö', '010-2222-3333','han1');

select * from PRIMARY_COLUMN;

-- ���̺���� �������
-- �÷��� ���ǿ� ��������� ���Ǹ� �и��Ͽ� �ۼ��� �� �ִ�.
CREATE TABLE PRIMARY_TABLE(
	name varchar2(20),
 	phone varchar2(13),
 	id varchar2(20),
 	constraint pk_primary_table primary key(id)
);

--�߰�����
insert into primary_table(name, phone, id) values ('������', '010-1234-4321', 'jin');

select * from PRIMARY_TABLE;


---- �������� �÷��� �ϳ��� PK�� ����
-- �����۹�ȣ, �����۸�, ��������, ����
-- ( �������� �Ϸ翡 �ѹ��� ���갡�� )
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

-- �߰�����
-- ���ʵ������Է�
INSERT INTO PRIMARY_MULTI(ITEM_NUM,NAME,ITEM_DATE,ITEM_INFO)
VALUES( 1000, 'Ű����', '20210302',
'��극�� ������� ������ Ű����. �ݹ߷��� ������');

INSERT INTO PRIMARY_MULTI(ITEM_NUM,NAME,ITEM_DATE,ITEM_INFO)
VALUES( 1000, 'Ű����', '20210303',
'��극�� ������� ������ Ű����. �ݹ߷��� ������');
-- ������ ��ȣ�� ��¥�� �ٸ��� �Է°���
INSERT INTO PRIMARY_MULTI(ITEM_NUM,NAME,ITEM_DATE,ITEM_INFO)
VALUES( 1001, 'Ű����', '20210301',
'���� Ű����� û��, ����, ����,������ ������, ���⿡���� ���ϴ� Ű�� ������ �� �ִ�.');

-- ����
-- �����۹�ȣ�� �������ڰ� ���� ���
INSERT INTO PRIMARY_MULTI(ITEM_NUM,NAME,ITEM_DATE,ITEM_INFO)
VALUES( 1001, '���콺', '20210301',
'�ո��� �����ϱ����� ���� ������ ����Ͽ� ������ ��ǰ���� ��¥�� insert �ȵ�');

 -- null�� �ԷµǸ� error
 INSERT INTO PRIMARY_MULTI(NAME,ITEM_DATE,ITEM_INFO)
VALUES('���콺', '20210303',
'��극�� ������� ������ Ű����. �ݹ߷��� ������');

INSERT INTO PRIMARY_MULTI(ITEM_NUM,NAME,ITEM_DATE,ITEM_INFO)
VALUES( 1000, 'Ű����', '',
'��극�� ������� ������ Ű����. �ݹ߷��� ������');

-- primary key�� �����ϸ� unique index�� �ڵ�����
-- index�� Ȯ���ϴ� Data Dictionary�� user_indexes
select * from user_indexes;
















