
select *
from EMP;

-- 1��
select EMPNO, ENAME, HIREDATE, DEPTNO, SAL
from EMP
where (DEPTNO != 10) AND (SAL BETWEEN 1000 AND 3000);

-- 2��
select EMPNO, ENAME, SAL, COMM, SAL+COMM AS TOTAL, round(SAL/12)  AS MONTHLYPAY
from EMP
where COMM IS NOT NULL;

-- 3��
select ENAME, EMPNO, HIREDATE, JOB
from EMP
where DEPTNO IN (10,30);

-- 4��
select EMPNO, ENAME, HIREDATE, SAL, JOB, DEPTNO
from EMP
where SAL < 3000;

-- 5��
create table test_like(
	Num number(1),
	name char(9),
	address varchar2(40),
	highschool varchar2(9)
);

insert into test_like values(1,'������','����� ���۱� �󵵵�','�����');
insert into test_like values(2,'���븸','����� ���빮�� ���빮1��','��Ÿ��');
insert into test_like values(3,'���¼�','����� ���빮�� ���빮2��','�����');
insert into test_like values(4,'�ڱ��','����� ���۱� �󵵵�','������');

commit;

select *
from test_like;

-- 6��
select '��ȣ : '||NUM||' �̸� : '||NAME||' �ּ� : '||ADDRESS||' �б� : '||HIGHSCHOOL
from test_like
where ADDRESS LIKE '�����%';

-- 7��
select EMPNO, ENAME, SAL, HIREDATE, DEPTNO, JOB
from EMP
where ENAME LIKE '____' AND SAL>=3000;

-- 8��
select EMPNO, ENAME, HIREDATE, SAL, SAL-(SAL*0.07) AS NEXTYEAR
from EMP;

-- 9��
select ENAME, EMPNO, HIREDATE, SAL, SAL+COMM AS TOTAL, (SAL+COMM)-(SAL+COMM)*0.033 AS AFTERTAX
from EMP;

-- 10��
select ENAME, SAL, JOB, MGR, HIREDATE
from EMP
WHERE ENAME LIKE 'A%' AND SAL >= 1600;
