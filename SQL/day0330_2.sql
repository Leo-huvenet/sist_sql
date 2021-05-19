select /*+ index_desc( zipcode_idx dong_idx) */zipcode, sido, gugun, dong, bunji
from zipcode_IDX
where dong >= 'A' and dong = '흑석동';

--날짜에 숫자를 연산하면 일자가 변경된다.
select sysdate, sysdate+1, sysdate+2, sysdate-1, sysdate-2
from dual;

--현재월에서 월 더하기 연산
-- add_months (날짜, +개월수)
select sysdate, add_months( sysdate, 4), add_months( sysdate, -4)
from dual;

-- 두 날짜간의 개월 차이 : months_between(큰날짜, 작은 날짜)
select months_between('2020-03-30','2020-01-30'),
		months_between(sysdate,'2020-01-30')
from dual;
