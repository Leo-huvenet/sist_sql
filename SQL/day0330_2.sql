select /*+ index_desc( zipcode_idx dong_idx) */zipcode, sido, gugun, dong, bunji
from zipcode_IDX
where dong >= 'A' and dong = '�漮��';

--��¥�� ���ڸ� �����ϸ� ���ڰ� ����ȴ�.
select sysdate, sysdate+1, sysdate+2, sysdate-1, sysdate-2
from dual;

--��������� �� ���ϱ� ����
-- add_months (��¥, +������)
select sysdate, add_months( sysdate, 4), add_months( sysdate, -4)
from dual;

-- �� ��¥���� ���� ���� : months_between(ū��¥, ���� ��¥)
select months_between('2020-03-30','2020-01-30'),
		months_between(sysdate,'2020-01-30')
from dual;
