-- ���� �ּ�
/*
  ������ �ּ�
*/
 select * from tab;

 select * from test;

 insert into test values(1,'�����',24,sysdate);
 insert into test values(2,'���μ�',27,sysdate);

 --transaction�Ϸ�
 commit;

 --select--
 select name,age
 from test;

 -- test���̺������ ���ڵ��� �Է��ϸ� ��ȸ
 select input_date
 from test;

 -- �μ����̺��� �μ���ȣ, �μ���, ��ġ ��ȸ
 select deptno, dname, loc
 from dept;

 -- ������̺��� �����ȣ, �����, ����, �μ���ȣ ��ȸ
 SELECT EMPNO, ENAME, JOB, DEPTNO
 FROM EMP;

 -- ��ȸ �÷��� *�� ����ϸ� �÷����� ���� ��� �÷��� ���� ��ȸ�� �� �ִ�.
 select *
 from test;

 -- test���̺��� �̸��� '�����'�� ����� ���̸� 26���� �Է����� �����ϴ�
 -- ������ ��¥������ �����ϼ���.

 update test
 set age=26, input_date=sysdate
 where name='�����';

 commit;

 -- update --

 --������̺��� �����ȣ�� 7839�� ����� ������� '������' ������ '����',
 --������ 2000���� ����

 select *
 from EMP;

 update EMP
 set ENAME ='������', JOB ='����', SAL = 2000
 where MGR = 7839;

 rollback;

 -- delete --
 select *
 from test;

 -- ��� ���ڵ� ����
 Delete from test;
 rollback;

 -- Ư�����ڵ� ����
 -- test���̺��� ��ȣ�� 1���� ���ڵ带 ����
 delete from test
 where num = 1;

 -- truncate --

 -- test ���̺��� ��� ���ڵ带 ����
 truncate table test;
 -- truncate�� transaction��� ������ �ƴϹǷ� rollback���� �۾��� ����� �� ����.
 rollback;

 select * from TEST;

 purge recyclebin;

 -- drop --

 -- test���̺��� ����
 drop table test;

 -- ������ ����
 purge recyclebin;

 -- �����뿡 �ִ� ���̺� �����ϱ�
 flashback table test to before drop;

