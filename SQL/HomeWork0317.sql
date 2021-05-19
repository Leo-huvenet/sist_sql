Create table student(
	num number(5),
	name varchar2(30),
	class varchar2(1),
	email varchar2(50),
	phone_num varchar2(13),
	address varchar2(240),
	gender varchar2(6),
	java_score number(3),
	input_date date
);

--���̺� ��������
desc student;

insert into student values(1,'��','A','kang@sist.co.kr','010-1234-5678','��⵵ ���ν�','����',91,sysdate);
   commit;
insert into student values(2,'�ڱ��','A','park@daum.co.kr','010-7739-9761','����� ������ ����1��','����',90,sysdate);
   commit;
insert into student values(3,'������','A','song@test.co.kr','010-5878-8813','����� ���۱� �󼺵��� ','����',97,sysdate);
   commit;
insert into student values(4,'���й�','B','lee@google.co.kr','010-234-7611','����� ���빮�� ���빮��','����',190,sysdate);
   commit;
insert into student values(5,'�ѻ��','B','hansang@sist.co.kr','010-4334-7656','��õ�� ���� ����3��','����',89,sysdate);
   commit;

 
--delete from student;

-- 3��
select *
from student;

-- 4��
select name,class,address,java_score
from student;

-- 5��
update student
set gender = '����', java_score = 90, class ='A', phone_num ='010-2234-7611'
where num = 4;

-- 6��
update student
set class ='A', phone_num ='010-1111-2341'
where name = '�ѻ��';

--7��
delete from student
where class ='A';

--8��
rollback;

--9��
DROP TABLE student;

-- ������ ����
-- show recyclebin

-- ������ ����
-- purge recyclebin

-- �����뿡 �ִ� ���̺� �츮��
flashback table student to before drop;

-- 10��
truncate table student;

-- 11��
drop table student;

-- 12��
-- show recyclebin
purge recyclebin;









