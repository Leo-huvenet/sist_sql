-- �����簡 '����','���','BMW'�� ��� ������ ������, ������, �𵨸�, ����,
-- ����, �ɼ��� ��ȸ
select * from CAR_MODEL;
select * from CAR_MAKER;
select * from CAR_COUNTRY;

-- Oracle
select cc.country, cc.maker, cma.model, cmo.car_year, cmo.price, cmo.car_option
from CAR_COUNTRY cc, CAR_MAKER cma, CAR_MODEL cmo
where (cma.maker = cc.maker and cmo.model(+) = cma.model)
			 and cma.maker in('����','���','BMW');

-- ANSI
SELECT cc.country, cc.maker, cma.model, cmo.car_year, cmo.price, cmo.car_option
FROM CAR_COUNTRY cc
inner JOIN CAR_MAKER cma
ON cma.maker = cc.maker
LEFT JOIN CAR_MODEL cmo
ON cmo.model = cma.model
WHERE cma.maker in('����','���','BMW');

-- ���̺� ������ ���� -

select * from user_constraints;

drop table zipcode;
drop table emp;
drop table dept;
drop table WORK_0324;

purge recyclebin;
