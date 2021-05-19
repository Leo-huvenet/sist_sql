SELECT * FROM DEPT;
SELECT * FROM zipcode;


-- ����1
drop table WORK_0324;

CREATE TABLE WORK_0324 (
	num number,
	ID VARCHAR2(10),
	NAME varchar2(30),
	AGE NUMBER,
	R_DEPTNO number(2),
	phone varchar2(13) ,
	zipcode varchar2(20),
	address varchar2(60),
	CONSTRAINT PK_ID PRIMARY KEY(ID),
	CONSTRAINT FK_DEPTNUM FOREIGN KEY(R_DEPTNO) REFERENCES DEPT(DEPTNO) on delete cascade,
	CONSTRAINT UK_zipcode UNIQUE(zipcode)
);

select * from WORK_0324;

-- ����2

--PRIMARY KEY -  null�� ������� �����鼭 ����
insert into work_0324(num, id, name, age, r_deptno, phone, zipcode, ADDRESS)
values (1,'hong','ȫ�浿',34,20,'010-1234-5678','135-554','����');

insert into work_0324(num, id, name, age, r_deptno, phone, zipcode, ADDRESS)
values (1,'','ȫ�浿',34,20,'010-1234-5678','135-554','����'); -- null���̹Ƿ� ����x

insert into work_0324(num, id, name, age, r_deptno, phone, zipcode, ADDRESS)
values (2,'hong','�̼���',44,10,'010-1234-4321','145-554','����'); -- ����(unique)��������

--FOREIGN KEY 
-- null���, �ٸ� ���̺�(�θ����̺�)�� �����ϴ� ���� �̿밡��
-- �����ϴ� �÷��� ���� ���� ���̺�(�θ����̺�)�� �ڽ����̺��� �����ϴ� ���ڵ尡 �����ϸ�  
-- �������� �ʴ´�(on delete cascade�� �̿��Ͽ� �����������)

insert into work_0324(num, id, name, age, r_deptno, phone, zipcode, ADDRESS)
values (1,'jang','�念��',34, 50,'010-1234-5678','131-544','����'); -- �ٸ� ���̺�(�θ����̺�)�� �����ϴ� ���� �ƴ� ���̹Ƿ� ����x

--UNIQUE - null���, ���� �����ϸ鼭 �����ؾ� �� ��
insert into work_0324(num, id, name, age, r_deptno, phone, zipcode, ADDRESS)
values (1,'jong','�������',34,40,'010-1234-5678','135-554','����'); -- zipcode���� �������� ����


