select * from EMP;

-- ������̺��� �Ի��� 23���� ����� �����ȣ, �����, ����, �Ŵ�����ȣ,
-- �Ի���, ������ ��ȸ�Ͽ� cp_emp3���̺� �߰��ϼ���.

insert into cp_emp3
(select EMPNO, ENAME, JOB, MGR, HIREDATE, SAL
from emp
where to_char(HIREDATE,'dd') = '23');

commit;

select * from CP_EMP3;

select * from CAR_COUNTRY; -- ������
select * from CAR_MAKER; -- ������
select * from CAR_MODEL; -- ��������

-- 5�ʿ� 6�ʿ� �Ǹŵ� ������ �𵨸�, �Ѱ���, ��տ����� ��ȸ
select MODEL, sum(PRICE), trunc(avg(CC),0)
from CAR_MODEL
where to_char(HIREDATE,'ss') in('06', '05')
group by MODEL;

-- ������ �Ǹ������� �߰��ϴ� ���̺�
create table car_sales(
	model varchar2(30),
	total_price number,
	avg_car_year number,
	input_date date);

-- 5�ʿ� 6�ʿ� �Ǹŵ� ������ �𵨸�, �Ѱ���, ��տ����� ��ȸ���� �����Ǹ�
-- ���̺� �߰�
insert into car_sales
(select MODEL, sum(PRICE) total_price, trunc(avg(CC),0) avg_car_year,
		sysdate
from CAR_MODEL
where to_char(HIREDATE,'ss') in('06', '05')
group by MODEL);

select * from CAR_SALES;

-- update subquery --
select * from CP_EMP1;
-- �����ȣ�� '1213'�̸鼭 ������� '���й�'�� ����� ������
-- �����ȣ�� '1212'�� ����� ������ ������ ����
update cp_emp1
set sal = ( select sal from cp_emp1 where empno = 1212 )
where empno = 1213 and ename = '���й�';

commit;

select * from cp_emp2;
-- cp_emp2���̺��� 7698 �Ŵ����� �����ϴ� ����� ������ cp_emp1���̺���
-- �����ȣ�� 1213����� �������� ����
-- (5���� ������ ���� - ������ subquery : where���� in�� ����ϴ� ���)


update cp_emp2
set sal = (select sal from cp_emp1 where empno = 1213)
where empno in (select empno from cp_emp2 where mgr = 7698);

commit;

-- delete subquery --

create table cp_emp4 as (select empno, ename, deptno, job, hiredate from emp);

-- cp_emp1���̺� �����ȣ�� '7566' �� ����� �ٹ��ϴ� �μ���ȣ�� ��ȸ�Ͽ�,
-- cp_emp4���̺��� �ش� �μ��� �ٹ��ϴ� ����� ��� �����ϼ���.

delete from cp_emp4
	where deptno = (select deptno from cp_emp1 where empno = 7566);

select * from cp_emp4;

commit;

-- cp_emp1���̺��� 10���μ��� �ٹ��ϴ� �����ȣ�� ��ȸ�Ͽ�,
-- cp_emp4���̺� ��ġ�ϴ� �μ���������� �����ϼ���.
delete from cp_emp4
	where empno in (select empno from cp_emp1 where deptno = 10);

