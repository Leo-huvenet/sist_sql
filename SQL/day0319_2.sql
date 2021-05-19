--���ڿ��Լ�--
--���ڿ�����
select length('test'), length('������ �ݿ���')
from dual;

--������̺��� ������� 4������ ����� �����, �����ȣ, �Ի��� ��ȸ
select ename, empno, hiredate
from emp
where length(ename)>=4;

-- �빮��, �ҹ��� ��ȯ
select upper('abcd') ,upper('Abcd'), lower('ABCD'), lower('AbCd')
from dual;

-- ������̺��� ������� 'scott'�� ����� �����ȣ, �����, ����, ����, �Ի����� ��ȸ
select EMPNO, ENAME, JOB, SAL, HIREDATE
from EMP
where lower(ename) = 'scott';  --�ҹ��ڷ� �ٲ㼭 ��ȸ
-- where ENAME like upper('scott'); -- �빮�ڷ� �ٲ㼭 ��ȸ

select * from emp;

-- ù���ڸ� �빮�ڷ�, ���������� ù���ڵ� �빮�ڷ� �ٲ��ش�
select initcap('java'), initcap('oracle'), initcap(' html')
from dual;

--���ڿ����� Ư�����ڿ��� �ε������(����Ŭ �����ε����� 1��)
select instr('test', 'e'), instr('test','k')
from dual;

-- ������̺��� ����� 'A'�� �ִ� ����� �����, �����ȣ, ������ ��ȸ
select ENAME, EMPNO, SAL
from  EMP
where instr(ename,'A') != 0;
-- where instr(ename,'A') <> 0;

-- ���ڿ� �ڸ���
-- ���۹��ڷ� ���� �ڸ� ������ �����ε����� 0�Ǵ� 1�� ����� �� �ִ�.
select substr('abcdefg',3,4), substr('abcdefg',3), substr('abcdefg',0,4)
,substr('abcdefg',1,4)
from dual;

-- ���ڿ���ġ��
select 'ABC'||'DEF'||'HIJ', CONCAT( CONCAT('ABC','DEF'),'HIJ')
FROM DUAL;

--��������
-- �յڰ�������
select '['||trim('   A BC   ')||']','['||ltrim('   A BC   ')||']', '['||rtrim('   A BC   ')||']'
from dual;

-- ���ڿ��� Ư�����ڿ��� ������ ���� �� ���ڿ��� ������ �� �ִ�.
-- trim( ���﹮�ڿ� form ���ڿ�)
select trim('a' from 'aaaaaaOracleaaaaaa')
from dual;

-- ���ڿ� ġȯ
select replace('abcabcabc', 'bc', 'a')
from dual;

-- ������̺��� ������� ��ȸ
-- ��, ����� 'A'�� 'a'�� �����Ͽ� ��ȸ
select ENAME, replace(ENAME,'A','a'), initcap(ename)
from emp;

-- ������̺��� �����ȣ, �����, �Ի����� ��ȸ
-- ��, �����ȣ SIST_0000001111 �� �������� ��ȸ�� ��

select EMPNO, CONCAT('SIST_',Lpad(EMPNO, 10,0)) AS FORMAT_EMPNO, ENAME, HIREDATE
from EMP

