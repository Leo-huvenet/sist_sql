-- check, notnull, default
-- skdlsms 20~30�븸 �Է�, �̸��� �ݵ�� �ԷµǾ���Ѵ�.
-- �Է����� �����Ǹ� ���ڵ尡 �߰��Ǵ� ������ ��¥ ������ �߰��Ǿ���Ѵ�.
drop table other_constraint;

create table other_constraint(
	num number, -- number ���� 22�ڸ����� ���尡��
  name varchar2(30byte) not null,
  age number(2) check(age between 20 and 39),
	input_date date default sysdate
);

--������� Ȯ��
--check, not null
select * from user_constraints
where table_name = 'OTHER_CONSTRAINT';

-- default
select * from user_tab_cols
where table_name = 'OTHER_CONSTRAINT';

-- �߰�����
-- �̸��� �ԷµǸ鼭, ���̰� 20~30��, �Է����� �����ǵ� �ȴ�.
insert into other_constraint(num, name, age, input_date)
values(1,'�ڱ��',25,sysdate);

-- �̸��� �ԷµǸ鼭, ���̰� 20~30��, �Է����� �����ǵ� �ȴ�(default)
insert into other_constraint(num, name, age)
values(2,'���μ�',26);

--�߰�����
--not null ���ǿ� ����Ǿ��� ��
insert into other_constraint(num, name, age)
values(3,'������',19);

insert into other_constraint(num, name, age)
values(3,'������',40);

-- not null ���ǿ� ����
insert into other_constraint(num,age)
values(3,40);




select * from other_constraint;

