-- ���ڷε� ����
select trunc(dbms_random.value(1,10),0)
from dual;

-- �������� ���ڰ� ȥ�յ� ����
select dbms_random.string('u',5), dbms_random.string('l',5),
			 dbms_random.string('a',5), dbms_random.string('x',5),
			 dbms_random.string('p',5)
from dual;
