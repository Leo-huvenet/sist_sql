-- PRIMARY_COLUMN���̺��� �ڽ� ���̺� ����
-- ID�� ����Ͽ� �ΰ����� ������ �� ������ ��
-- �ڽ����̺��� �÷���� ���������� ũ��� �޶� �ȴ�.
-- foreign key�� ������ �������.
drop table foreign_column;

CREATE TABLE foreign_column(
	id varchar2(20) constraint fk_id references primary_column(id) on delete cascade,
	subject varchar2(30),
	score number(3)
);

select * from user_constraints
where constraint_type = 'R';

-- �߰�����
-- �θ����̺� �����ϴ� ������ ���ڵ尡 �߰��� ��
insert into foreign_column(id,subject,score)
values('han','�ڹ�',90);

insert into foreign_column(id,subject,score)
values('han','����Ŭ',95);

--null �Է� ���
insert into foreign_column(id,subject,score)
values('','����Ŭ',95);

-- �߰�����
-- �θ����̺� �������� �ʴ� ������ �߰��� ��
insert into foreign_column(id,subject,score)
values('han2','����Ŭ',90);

-- ���ڵ����
-- �ڽ����̺��� ���ڵ�� �׳ɻ����ȴ�
-- ���̺��� ���ڵ�� �ڽ����̺��� ���ڵ尡 �����ϴ� ���������� �ʴ´�.

-- han1 ���̵�� �����ϴ� ���ڵ尡 �������������Ƿ� �ٷ� ����
delete from primary_column where id = 'han1';

-- han ���̵�� �����ϴ� ���ڵ尡 �����ϹǷ� �������� �ʴ´�(���� ���Ἲ)
delete from primary_column where id = 'han';
-- �����Ϸ��� �ڽķ��ڵ带 ��� ���� �� �θ����̺��� ���ڵ带 �����Ѵ�.
delete from foreign_column where id = 'han';
delete from primary_column where id = 'han';



select * from PRIMARY_COLUMN;
select * from FOREIGN_COLUMN;

--���̺�����������--
--�ڽ����̺��� �÷���� ���������� ũ��� �޶� �ȴ�
create table foreign_table(
	r_id varchar2(30),
	subject varchar2(20),
	score number(3),
	constraint fk_r_id foreign key(r_id) references primary_table(id)
	);
	
	


