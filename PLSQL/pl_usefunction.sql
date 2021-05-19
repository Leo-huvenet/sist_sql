select * from user_procedures
where object_type='FUNCTION';

-- ��������
--select plus(1,2)
--from dual;
--
--select high(4,9)
--from dual;

-- 1��������999999999999 ���� 1�� �����ϴ� ������ ����
create sequence seq_func
increment by 1
start with 1
maxvalue 999999999999
cache 25
nocycle;

select * from user_sequences;

-- �Ű������� ���� �Լ��� ȣ���� �� �Լ��� ����
select sist_num
from dual;

-- �ڵ尪�� ��ȯ�ϴ� �Լ��� insert�� �� �ַ� ����Ѵ�.
create table function_insert(
num char(15) constraint pk_function_insert primary key,
name varchar2(15)
);

--function�� () �ְ� �׽�Ʈ
insert into function_insert(num,name) values ( sist_num(), '���μ�');
--function�� () ���� �׽�Ʈ
insert into function_insert(num,name) values ( sist_num, '������');

select * from function_insert;

-- �Լ�����
drop function plus;
drop function high;

select chk_ssn('981103-1331229')
from dual;

-- �����̱� : ��Ű���� ����� �Լ� DBMS_RANDOM.value(����,����)

select trunc(dbms_random.value(1,10),0) random1,
 trunc(dbms_random.value(100000,999999),0) random2
from dual;

select create_ssn(981103,1) ssn
from dual;
