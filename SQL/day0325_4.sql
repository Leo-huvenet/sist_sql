--union : ���δٸ� ���̺� ��, �Ʒ��� �����Ͽ� ��ȸ
-- emp : �ѱ����� �������, cp_emp1 : �̱����� �������
-- ����� ���� ��������� ��ȸ
-- ��ȸ�÷��� �����ȣ, �����, ����, ����
select EMPNO, ENAME, JOB, SAL
from emp
union all
select EMPNO, ENAME, JOB, SAL
from cp_emp1  ;

-- ������ȸ
select EMPNO, ENAME, JOB, SAL
from emp
where empno = 7369
union all
select EMPNO, ENAME, JOB, SAL
from cp_emp1
order by empno ;
