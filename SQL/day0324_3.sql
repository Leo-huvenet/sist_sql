-- unique ���
-- ��ȣ, �̸�, ��ȭ��ȣ�� ����

-- �÷������� �������
create table unique_column(
	num number,
	name varchar2(30),
	phone varchar2(13) constraint uk_phone unique
);

truncate table unique_column;

-- �������Ȯ��
select * from user_constraints;
-- ������ �ε���Ȯ��
select * from user_indexes;

-- �߰�����
insert into unique_column(num, name, phone)
values(1,'�׽�Ʈ','010-1234-5678');

-- �ٸ� ��ȭ��ȣ�� �Է�
insert into unique_column(num, name, phone)
values(2,'�׽�Ʈ','010-1234-5679');

-- ��ȭ��ȣ�� null �Է�(null ��밡��)
insert into unique_column(num, name, phone)
values(3,'�׽�Ʈ','');

insert into unique_column(num, name)
values(4,'�׽�Ʈ');

-- error
-- ���� ��ȭ��ȣ�� �ԷµǸ� ����
insert into unique_column(num, name, phone)
values(5,'���ϴ�','010-1234-5678');

select * from unique_column;

-- ���̺����
create table unique_table(
	num number,
	name varchar2(30),
	email varchar2(50),
	card_num char(4),
	constraint uk_card_num unique(card_num),
	constraint uk_email unique(email)
);

-- ������� ��ȸ
select * from user_constraints
where constraint_type = 'U';

select * from user_indexes
where table_name = 'UNIQUE_TABLE';


