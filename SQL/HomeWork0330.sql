-- ����1
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

  dbms_output.put_line('�Ϸ�뵷' ||pocketMoney||'��, ������� : '||halfTraffic||
			'��, �պ������ : '||traffic||'��, ���ɰ� : '||lunch||'�� ���� �뵷 '||Remaining||'�� �Դϴ�.');

end;
/

-- ����2
-- �¾�� = ����⵵ - ���� + 1
set serveroutput on

	accept age prompt '�����Է� : '
declare

begin

  dbms_output.put_line(to_char(sysdate,'yyyy') - &age +1 ||'��');
end;
/

--����3
select * from EMP;

SELECT EMPNO, ENAME, to_char(HIREDATE,'mm-dd-yyyy day')HIREDATE, LOS, COMM
FROM(select EMPNO, ENAME,HIREDATE, trunc(months_between(add_months(sysdate,24), HIREDATE)/12)as LOS, COMM
		 from EMP
		 )
WHERE LOS > 34;








