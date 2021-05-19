select * from user_indexes;

select * from user_ind_columns
where table_name = 'EMP';

select rowid, empno, ename, job from emp;


-- 인덱스를 설정할 테이블  생성
create table zipcode_idx as select * from zipcode;

-- unique 인덱스 설정
-- 값이 중복되는 컬럼에 설정 할 수 없다 - unique index
create UNIQUE INDEX  idx_zipcode on zipcode_idx(SEQ);

drop index idx_zipcode;

select * from user_indexes
where table_name = 'ZIPCODE_IDX';

select * from user_ind_columns
where table_name = 'ZIPCODE_IDX';

-- 인덱스가 존재하지 않는 테이블 조회
select zipcode, sido, gugun, dong, bunji
from zipcode
where seq = 50000;

select zipcode, sido, gugun, dong, bunji
from zipcode_idx
where seq = 50000;


-- 인덱스를 사용한 문자열의 정렬 0.156s
select zipcode, sido, gugun, dong, bunji
from zipcode
order by dong desc;

-- 인덱스 설정
create index dong_idx on zipcode_idx(dong);

select *
from user_indexes
where table_name = 'ZIPCODE_IDX';

SELECT *
FROM USER_IND_COLUMNS
where table_name = 'ZIPCODE_IDX';

--hint 설정
select /*+ index_desc( zipcode_idx dong_idx) */ zipcode, sido, gugun, dong, bunji
from zipcode_IDX
where dong >= 'A' and dong = '흑석동';




