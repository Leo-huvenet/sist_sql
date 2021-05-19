 -- select subquery --
 -- �ܼ���
 -- emp���̺��� �����ȣ�� '7369'�� ����� �ٹ��ϴ� �μ���ȣ�� ��ȸ�Ͽ�,
 -- cp_emp1���̺� ���� �μ������ ������ ��� ��ȸ
 select * from emp;
 select * from cp_emp1;

 select empno, ename, deptno, job, sal
 from cp_emp1
 where deptno = ( select deptno from emp where empno = 7369);

 -- �𵨸��� '�׷���'�� ������ ������ ��ȸ

 select * from car_country;
 select * from CAR_MAKER;
 select * from CAR_MODEL;

 select country
 from car_country
 where maker = (select maker from CAR_MAKER where model = '�׷���');

 -- �����簡 '����'�� ������ �𵨸�, ����, ����, �ɼ��� ��ȸ
 select MODEL, CAR_YEAR, PRICE, CAR_OPTION
 From CAR_MODEL
 where model in(select model from car_maker where maker = '����') ;

 -- scalar subquery --

 -- ��ȸ�� ���� ����Ͽ� �ٸ����̺��� �÷� ���� ��ȸ�Ͽ� ������ ��
 -- �����ȣ, �����, �μ���ȣ, �μ��� ��ȸ
 select empno, ename, deptno,
 	(select dname from dept where dept.deptno = emp.deptno) as dname
 from emp;


 -- car_model, car_maker ���
 -- ����� 2012���� ������ �𵨸�, ���, ����, �ɼ�, �Է���, �̹���, �����縦 ��ȸ

 select * from car_model;

 select MODEL, CAR_YEAR, PRICE, CAR_OPTION, HIREDATE, CAR_IMG,
 	(select maker from CAR_MAKER where car_maker.model = car_model.model) as maker
 	from car_model
 	where CAR_YEAR  = '2012';

 	-- select ������ subquery (�˻��� ����� ������ ����ȸ : inline view�� ����� ��ȸ)
 	-- ����
 	select empno, ename, job, sal, hi -- inline view�� �����ϴ� �÷��� ���ڵ带 �˻�
 	-- alias�� �����÷���ó�� ���.
 	from (select empno, ename, sal, job, hiredate as hi from emp)
	where to_char(hi,'yyyy') = '1980';


 -- rownum --
 -- ������̺��� �Ի���� '1981'���� ������� ������ȣ, �����ȣ, �Ի����� ��ȸ
 -- ��ȸ����� �����ȣ�� ���
 select rownum, empno, ename, hiredate
 from emp
 where to_char(hiredate, 'yyyy') = '1981';

 -- rownum�� order by���� ���� �����ǹǷ� �����ϸ� ��ȣ�� ���δ�.
 -- ������̺��� ������ȣ, �����ȣ, �����, ������ ��ȸ
 -- ��, ������� ������������ �����Ͽ� ��ȸ
 select rownum, empno, ename, job
 from emp
 order by ename;

 -- 1�����ʹ� ��ȸ���ǳ� ���Ĺ�ȣ���ʹ� ��ȸ���� �ʴ´�.
 -- ������̺��� ��ȣ, �����ȣ, ������� ��ȸ
 -- ��, ��ȣ�� 1~5�� ������ ���ڵ常 ���
	select rownum, empno, ename
	from emp
	where rownum between 1 and 5;
--  where rownum >= 1 and rownum < 6;

-- select���� ���� �̸����� ���� ���ȴ�(ROWNUM ��ȣ�� 2��ǥ�õ�)
select rownum, rnum, ename, empno
from ( select rownum as rnum, ename, empno from emp order by ename);

-- ������̺��� ���帶������ �Ի��� ����������� 5���� ��������� ��ȸ
-- (2~6������ ��ȸ
-- ���� �������� �Ի��� ������� 1���� �ο�
 select * from EMP ;

select rnum, EMPNO, ENAME, JOB, HIREDATE
from (select rownum rnum, EMPNO, ENAME, JOB, HIREDATE  -- rownum�� 1�����͸� ��ȸ�ǹǷ� rownum�� �����÷�ó�� �ν�
 			from(select EMPNO, ENAME, JOB, HIREDATE
			 		 from emp
			     order by HIREDATE desc
					)
		 )
where rnum between 2 and 6;
----------------------------------------------------------
select EMPNO, ENAME, JOB, HIREDATE, rnum
from(select EMPNO, ENAME, JOB, HIREDATE,
				row_number() over(order by HIREDATE desc) as rnum
from emp)
where rnum between 2 and 6;

-- �����ȣ ���̺��� �õ��� '����'�� ���ڵ带 dong�� ������������
-- �������� �� 150~200�� ������ ���ڵ带 ��ȸ
-- ��, ������ null �̸� '��������'; ���� ��ȸ
-- ��ȸ�÷� : �����ȣ, �õ�, ����, ��, ������ ��ȸ
select * from ZIPCODE;

select zipcode, sido, gugun, dong, nvl(bunji,'��������') as bunji
from(select ZIPCODE, SIDO, GUGUN, DONG, BUNJI,
			 row_number() over(order by dong desc) flag_num
 		 from zipcode
 		 where sido = '����')
where flag_num between 150 and 200;




