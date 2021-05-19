select * from user_indexes;

select * from user_ind_columns
where table_name = 'EMP';

select rowid, empno, ename, job from emp;


-- �ε����� ������ ���̺�  ����
create table zipcode_idx as select * from zipcode;

-- unique �ε��� ����
-- ���� �ߺ��Ǵ� �÷��� ���� �� �� ���� - unique index
create UNIQUE INDEX  idx_zipcode on zipcode_idx(SEQ);

drop index idx_zipcode;

select * from user_indexes
where table_name = 'ZIPCODE_IDX';

select * from user_ind_columns
where table_name = 'ZIPCODE_IDX';

-- �ε����� �������� �ʴ� ���̺� ��ȸ
select zipcode, sido, gugun, dong, bunji
from zipcode
where seq = 50000;

select zipcode, sido, gugun, dong, bunji
from zipcode_idx
where seq = 50000;


-- �ε����� ����� ���ڿ��� ���� 0.156s
select zipcode, sido, gugun, dong, bunji
from zipcode
order by dong desc;

-- �ε��� ����
create index dong_idx on zipcode_idx(dong);

select *
from user_indexes
where table_name = 'ZIPCODE_IDX';

SELECT *
FROM USER_IND_COLUMNS
where table_name = 'ZIPCODE_IDX';

--hint ����
select /*+ index_desc( zipcode_idx dong_idx) */ zipcode, sido, gugun, dong, bunji
from zipcode_IDX
where dong >= 'A' and dong = '�漮��';




