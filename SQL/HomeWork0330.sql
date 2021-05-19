-- 문제1
set serveroutput on

declare
	pocketMoney number;
	traffic number;
	halfTraffic number;
	lunch number;
	Remaining number;
begin
	pocketMoney := 10000;
	traffic := 3000;
	halfTraffic := traffic/2;
	lunch := 5000;
	Remaining := pocketMoney-(traffic+lunch);

  dbms_output.put_line('하루용돈' ||pocketMoney||'원, 편도교통비 : '||halfTraffic||
			'원, 왕복교통비 : '||traffic||'원, 점심값 : '||lunch||'원 남은 용돈 '||Remaining||'원 입니다.');

end;
/

-- 문제2
-- 태어난해 = 현재년도 - 나이 + 1
set serveroutput on

	accept age prompt '나이입력 : '
declare

begin

  dbms_output.put_line(to_char(sysdate,'yyyy') - &age +1 ||'년');
end;
/

--문제3
select * from EMP;

SELECT EMPNO, ENAME, to_char(HIREDATE,'mm-dd-yyyy day')HIREDATE, LOS, COMM
FROM(select EMPNO, ENAME,HIREDATE, trunc(months_between(add_months(sysdate,24), HIREDATE)/12)as LOS, COMM
		 from EMP
		 )
WHERE LOS > 34;








