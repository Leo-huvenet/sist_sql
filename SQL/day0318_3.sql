-- �����ּҸ� �����ϴ� ���̺� ����
-- �����ȣ,�õ�,����,��,����,seq�� �̷�����ִ�.
create table zipcode(
	zipcode char(7),
	sido char(6),
	gugun varchar2(25),
	dong varchar2(300),
	bunji varchar2(25),
	seq number(5)
);

truncate table zipcode;

select count(*) from zipcode;

--���̸����� �����ȣ �˻�
select ZIPCODE, SIDO, GUGUN, DONG, BUNJI
from zipcode
where DONG like '%�Ｚ��%';
