
select *
from EMP;

-- 1번
select EMPNO, ENAME, HIREDATE, DEPTNO, SAL
from EMP
where (DEPTNO != 10) AND (SAL BETWEEN 1000 AND 3000);

-- 2번
select EMPNO, ENAME, SAL, COMM, SAL+COMM AS TOTAL, round(SAL/12)  AS MONTHLYPAY
from EMP
where COMM IS NOT NULL;

-- 3번
select ENAME, EMPNO, HIREDATE, JOB
from EMP
where DEPTNO IN (10,30);

-- 4번
select EMPNO, ENAME, HIREDATE, SAL, JOB, DEPTNO
from EMP
where SAL < 3000;

-- 5번
create table test_like(
	Num number(1),
	name char(9),
	address varchar2(40),
	highschool varchar2(9)
);

insert into test_like values(1,'김정은','서울시 동작구 상도동','정기고');
insert into test_like values(2,'정대만','서울시 동대문구 동대문1동','썸타고');
insert into test_like values(3,'송태섭','서울시 동대문구 동대문2동','정기고');
insert into test_like values(4,'박기범','서울시 동작구 상도동','오지고');

commit;

select *
from test_like;

-- 6번
select '번호 : '||NUM||' 이름 : '||NAME||' 주소 : '||ADDRESS||' 학교 : '||HIGHSCHOOL
from test_like
where ADDRESS LIKE '서울시%';

-- 7번
select EMPNO, ENAME, SAL, HIREDATE, DEPTNO, JOB
from EMP
where ENAME LIKE '____' AND SAL>=3000;

-- 8번
select EMPNO, ENAME, HIREDATE, SAL, SAL-(SAL*0.07) AS NEXTYEAR
from EMP;

-- 9번
select ENAME, EMPNO, HIREDATE, SAL, SAL+COMM AS TOTAL, (SAL+COMM)-(SAL+COMM)*0.033 AS AFTERTAX
from EMP;

-- 10번
select ENAME, SAL, JOB, MGR, HIREDATE
from EMP
WHERE ENAME LIKE 'A%' AND SAL >= 1600;
