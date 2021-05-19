SELECT *
FROM EMP;

-- ��� ���̺��� 10�� �μ��� �ٹ��ϴ� ������� �����ȣ, �����, �Ŵ�����ȣ,
-- ����,�μ���ȣ�� ��ȸ

select EMPNO, ENAME, MGR , SAL, deptno
from emp
where deptno = 10;

-- ������̺��� 10�� �μ��� �ƴ� �μ�������� �����ȣ, �����, �Ŵ�����ȣ,
-- �Ի���, �μ���ȣ�� ��ȸ
select EMPNO, ENAME, MGR, HIREDATE, DEPTNO
from EMP
WHERE DEPTNO != 10;
-- WHERE DEPTNO <> 10;

-- ������̺��� ������ 1600�ʰ��� ������� �����ȣ,����,�����,����,
-- �Ի����� ��ȸ
select EMPNO, SAL, ENAME, JOB, hiredate
from emp
WHERE SAL > 1600;

-- ������̺��� ������ 1600�̻� 3000 ������ ����� �����, �����ȣ, ����,
-- ������ ��ȸ
select ENAME, EMPNO, SAL, JOB
from emp
WHERE SAL BETWEEN 1600 AND 3000;

-- ������̺��� 7902, 7698, 7566 �Ŵ����� �����ϴ� ����� �����ȣ, �����,
-- �Ŵ��� ��ȣ, �Ի���, ���� ��ȸ

select  EMPNO, ENAME, MGR, HIREDATE, JOB
from  EMP
WHERE MGR IN(7902,7698,7566);
-- WHERE MGR = 7902 OR MGR = 7698 OR MGR = 7566;

-- ������̺��� ���ʽ��� �޴� ������� �����ȣ, ����, ���ʽ�, �����, ������ ��ȸ
-- is null, is not null
select  EMPNO, SAL, ENAME, JOB
from  EMP
Where comm is not null;
-- WHERE COMM >= 0;

--������̺��� ������� 'ALLEN'�� ����� �����ȣ, �����, �Ի���, ����, �μ���ȣ�� ��ȸ
SELECT EMPNO, ENAME, JOB, DEPTNO
FROM EMP
WHERE ENAME LIKE 'ALLEN';
-- WHERE ENAME = 'ALLEN';


-- ������̺��� ������� 'A'�� �����ϴ� ������� �����, ����, ����, �Ի���
-- ��ȸ
SELECT EMPNO, SAL, JOB, HIREDATE
FROM ENO;
WHERE ENAME LIKE 'A';

--������̺��� ������� 'S'�� ���� ������� �����, ����, �����ȣ, �Ŵ�����ȣ,
-- �Ի����� ����
SELECT EMPNO, SAL, JOB, HIREDATE
FROM EMP
WHERE ENAME LIKE '%ES';

--������̺��� ������ 'A'�� ����ִ� ������� �����, ����, �����ȣ,
-- �Ի����� ��ȸ
SELECT EMPNO, SAL, JOB, HIREDATE
FROM EMP
WHERE ENAME LIKE '%A%';

-- ������̺��� ����� 'l'�� �ΰ� �ִ� ������� �����, �Ŵ�����ȣ, ������ ��ȸ
 SELECT EMPNO, SAL, JOB, HIREDATE
FROM EMP
WHERE ENAME LIKE '%L%L%';

-- ������̺��� ������� 5������ ������ ����� ��ȸ
SELECT ENAME
FROM EMP
WHERE ENAME LIKE '_____';

-- ������̺��� �̸��� 5�����̸鼭 �ι�°���ڰ� '0'�� �����
-- �����ȣ, �����, �Ի���, ������ ��ȸ

SELECT EMPNO, ENAME, HIREDATE, SAL
FROM EMP
WHERE ENAME LIKE '_0___';












