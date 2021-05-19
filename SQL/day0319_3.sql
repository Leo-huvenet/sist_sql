	-- ��ȯ�Լ� --
--���ں�ȯ
-- 0 �����Ͱ� ������ 0�� ä���
-- 9 �����ʹ� �ִ� �͸� �����ش�.
select to_char(2021, '0,0000,000'), to_char(2021.20210319,'00000000.00'),
  to_char(2021, '0,0000,000'), to_char(2021.20210319,'00000000.00')
	from dual;

select to_char(13*721231123, '9,999,999,999,999,999,999')
from dual;

-- ��¥��ȯ
-- ������ ��¥�����̰ų� Ư�����ڰ� �ƴ� ���ڸ� ����� �� ����. Error
-- ��¥������ �ƴϰų� Ư�����ڰ� �ƴ� ��쿡�� ""�� ����Ͽ� �ش� ���ڸ� ǥ���Ѵ�.
select to_char( sysdate, 'yyyy-mm-dd dy"����" day am hh12 hh hh24:mi:ss q')
from dual;

-- ��¥������ ��� error
select to_char(sysdate, 'yyyy " �� " mm " �� " dd " �� " q"�б�" hh24 " ��" mi " ��" ss " �� "')
from dual;

--������̺��� �����ȣ, �����, �Ի��� ��ȸ
--��, �Ի����� '��-��-�� �б�'�� �������� ��ȸ�� ��.
select EMPNO, ENAME, to_char(HIREDATE, 'mm-dd-yyyy q"�б�"') as hiredate
from emp;

-- ������̺��� 1981�⿡ �Ի��� ������� �����ȣ, �����, ����, �Ի���, ������ ��ȸ
select EMPNO, ENAME, SAL, HIREDATE, JOB
from emp
where to_char(HIREDATE, 'yyyy') Like '1981';

-- ���ں�ȯ
-- ���ڿ��� ���������̶�� to_number������� �ʾƵ� ����ȯ�� �ȴ�.
select '3'+'19', to_number('3') + to_number('19')
from dual;

-- ���������� ���ڿ��� Date������ ��ȯ
select '2021-03-19', to_date('2021-03-19','yyyy-mm-dd')
from dual;

-- Date���� �÷��� ���߰�
--���糯¥
insert into test1(input_date) values(sysdate);
--�ٸ���¥ : ��¥������ ���ڿ����. �ð������� ��� 00��00��00�ʷ� �߰�
insert into test1(input_date) values('2021-03-20');
--�ٸ���¥ : to_date�Լ� ���
insert into test1(input_date) values(to_date('2021-03-21','yyyy-mm-dd'));

select to_char(input_date, 'yyyy-mm-dd am hh24:mi:ss') from test1;

-- to_date�� error�� �߻��ϴ� ��� : to_char�Լ� ���
select /* to_char('2021-03-19', 'mm-dd-yy') */
			 to_char(to_date('2021-03-19', 'yyyy-mm-dd'),'mm-dd-yy')
from dual;

--�����Լ�--
select decode('d', 'a','����','b','��','c','��','��Ʈ')
from dual;

-- ������̺��� �����ȣ, �Ŵ�����ȣ, �μ���ȣ, �μ��� ��ȸ
-- ��, �μ����� �μ���ȣ�� ���� �Ʒ��Ͱ��� �����Ͽ� ��ȸ
-- 			10- SI����, 20-SM��������, 30-SE�����Ͼ� �׿ܶ�� ����

select EMPNO, MGR, DEPTNO, decode(DEPTNO,10,'SI����',20,'SM��������',30,'SE�����Ͼ�','����') as DNAME
from emp;

-- ������̺��� �����ȣ, �����, �μ���ȣ, ����, �μ��� ���ʽ��� ��ȸ
--��, �μ������ʽ��� �Ʒ��Ͱ��� �����Ѵ�.
--	10���μ� ������ 20%�� å��, 20���μ� ����25%�� å��
-- 30���μ��� ����+���ʽ��� �ջ��� �ݾ��� 15%�� å��
-- �׿ܴ� ������ 100%�� å���Ѵ�.

select EMPNO, ENAME, DEPTNO, SAL
		,decode(DEPTNO,10,'20%',20,'25%',30,'15%')
			,decode(DEPTNO,10,SAL*0.2,20,SAL*0.25,30,(SAL+nvl(COMM,0))*0.15) as deptno_sal
from emp;

