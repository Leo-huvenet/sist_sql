-- ����1

alter table cp_emp2 modify hiredate date default sysdate;
-- sysdate�� �⺻������ �ָ�  hiredate�� ���� �ʾƵ� �ȴ�.

insert into cp_emp2(EMPNO,ENAME, JOB, SAL, MGR) values(1111,'���μ�','���',2800,7902);
insert into cp_emp2(EMPNO,ENAME, JOB, SAL, MGR) values(1112,'�����','���',2800,7902);
insert into cp_emp2(EMPNO,ENAME, JOB, SAL, MGR) values(1113,'�ڱ��','�븮',3200,7893);

-- ����2
select * from EMp; -- ���� �������

select * from cp_emp2; -- ���� �������

select rnum, ENAME, JOB, to_char(SAL,'000,000,000') SAL, to_char(HIREDATE,'yyyy-mm-dd q"�б�"')HIREDATE from(
	select rownum rnum, ENAME, JOB, SAL, HIREDATE from(
		select ENAME, JOB, SAL, HIREDATE from(
			select EMPNO, ENAME, JOB, SAL,  HIREDATE, '����'
			from emp
			union all
			select EMPNO, ENAME, JOB, SAL, HIREDATE, '����'
			from cp_emp2
			)
		order by HIREDATE desc
	)
)
where rnum between 3 and 10;

-- ���� Ǭ Ǯ�� ������ : �Լ��� ���� �ٱ��� select���� ����ϱ� !!
--------------------------------------------------
-- ������ Ǯ��
select EMPNO, ENAME, JOB, to_char(SAL,'000,000,000') SAL, MGR, to_char(HIREDATE,'yyyy-mm-dd q"�б�"') HIREDATE, DEPT_LOC
from(SELECT EMPNO, ENAME, JOB, SAL, MGR, HIREDATE, DEPT_LOC,
			 ROW_NUMBER() OVER( ORDER BY HIREDATE DESC) r_num
		 FROM(select EMPNO, ENAME, JOB, SAL, MGR, HIREDATE, '����' dept_loc
		 		  from emp
		 		  union all
		 		  select EMPNO, ENAME, JOB, SAL, MGR, HIREDATE, '����'
				  from cp_emp2
		 		  ))
WHERE  R_NUM BETWEEN 3 AND 10;

