-- procedure ����
select * from user_procedures;

-- ���ε� ������ ����
var r number;
var m varchar2(100);
-- ���ν����� ��������
execute proc_plus(11, 26, :r, :m);
-- ���ε� ������ ���
print r
print m
----------------------------------------------------------
-- proc_zodiac
var msg varchar2(300);

exec proc_zodiac('���й�', 1997, :msg);

print msg;

----------------------------------------------------------
-- proc_zodiac2
var msg varchar2(300);

exec proc_zodiac2('�����', 1998, :msg);

print msg;

----------------------------------------------------------
--����ȸ
-- Ŀ���� ������ �� �ִ� ���������� ����Ͽ� bind ���� ����
var cur_zip refcursor;

-- ����
exec proc_zipcode('', :cur_zip);

-- ���
print cur_zip;
----------------------------------------------------------
--insert
select * from CP_EMP4;

var row_cnt number;
var msg varchar2(600);

-- procedure ����
exec proc_insert(1235, '���μ�', 10, '����', :row_cnt, :msg);
--out parameter�� �����ϴ� �� ���
print row_cnt;
print msg;

select * from cp_emp4;
----------------------------------------------------------
--bind ��������
var row_cnt number;
var msg varchar2(600);

--procedure ����
exec proc_update(1235, '���', 20, :row_cnt, :msg);

print row_cnt;
print msg;
----------------------------------------------------------
--bind ��������
var row_cnt number;
var msg varchar2(600);

--���ν�������
exec proc_delete(1235, :row_cnt, :msg);

print row_cnt;
print msg;

----------------------------------------------------------
--���ν��� ����
drop procedure proc_plus;

----------------------------------------------------------
-- 0405���� ����1
select * from CAR_MAKER;
select * from CAR_MODEL;

var CUR_CAR1 refcursor;

exec proc_car('K5',1, :cur_zip);

print cur_zip;

----------------------------------------------------------
-- 0405���� ����2
select * from CP_EMP3;

var row_cnt number;
var msg varchar2(600);

-- procedure ����
exec proc_emp3(10000, '����', 'AQ', 2800, :row_cnt, :msg);
--out parameter�� �����ϴ� �� ���
print row_cnt;
print msg;

delete from cp_emp3




