select '���μ�' name, 20 age
from dual;

--��ġ�Լ�--

-- ���밪
select abs(-3), abs(3)
from dual;

-- �ݿø� round(��, �ݿø� ���� �� �� �ڸ���)
select round(555.555, 2), round(555.554, 2), round(555.555), round(555.555, -1)
from dual;

-- �ø� ceil(��)
select ceil(10.1), ceil(10.0)
from dual;

-- ���� floor()
select floor(10.9), floor(10.0)
from dual;

-- ���� trunc()
select trunc(555.555, 2), trunc(555.555, 1), trunc(555.555, -1)
from dual;

-- ������̺��� �����ȣ, �����, ����, ������ ��ȸ
-- ��, ������ ������ 3.3%����Ͽ� ������ �����Ͽ� ��ȸ
select EMPNO, ENAME, SAL, trunc(SAL*0.033) as tax
from EMP;

--null��ȯ--
select nvl('','��'), nvl(null,'��ȯ��')
from dual;

-- ������̺��� �����ȣ, �����, ����, ���ʽ��� ��ȸ
-- ��, ���ʽ��� �������� �ʴ� �����  100���� �����Ͽ� ����Ѵ�.
select ENAME, EMPNO, SAL, nvl(COMM,100) as comm
from EMP;

-- ������̺��� �����ȣ, �����, ����, ���ʽ�, �Ѽ��ɾ� ��ȸ
-- �Ѽ��ɾ��� ������ ���ʽ��� �ջ��� �ݾ�
select EMPNO, ENAME, SAL, COMM, SAL+NVL(COMM,0) AS TOTAL
FROM EMP;

--NULL�� �ƴ� �� ������ ���� null�� �� ������ ���� ����
select nvl2('','null�� �ƴ� ��','null�� ��'), nvl2('a','null�� �ƴ� ��','null�� ��')
from dual;

-- ��� ���̺��� �����ȣ, �����, �Ŵ������翩�θ� ��ȸ
-- �Ŵ����� �����ϸ� 0, �Ŵ����� �������� ������ 1�� ��ȸ
select EMPNO, ENAME, nvl2(MGR,0,1)
from emp;

--insert �÷��� null�� �ԷµǴ� ��Ȳ--
--number�� date�� �÷��� ������ ��쿡 null�Է�
alter table test1 add input_date date;

insert into test1(name) values('�׽�Ʈ');
select * from test1;
commit;

-- varchar2�� char�� �÷��� ������ ���� ''�� �ԷµǴ� ��쿡 null�� �Է�
-- �÷��� ������ ���
insert into test1(age,input_date) values(20,sysdate);
-- ''�ԷµȰ��
insert into test1(name,age,input_date) values('',30,sysdate);

select * from test1;
commit;

-- test1���̺��� �̸�, ���̸� ��ȸ
-- ��, �̸��� null�ΰ�� '����'���� ���̰� null�� ��� 0���� ���
select nvl(name,'����') name,nvl(age,0)
from test1;



