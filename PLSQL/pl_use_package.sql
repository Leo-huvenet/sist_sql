select * from user_procedures;

-- ��Ű������� �Լ��� ���
-- �Լ��� ��������
select test_pack.birth(27)
from dual;

-- ��Ű������� ���ν����� ���
var cur_car refcursor;

exec test_pack.car_list(3, :cur_car);

print cur_car;

