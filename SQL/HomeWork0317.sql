Create table student(
	num number(5),
	name varchar2(30),
	class varchar2(1),
	email varchar2(50),
	phone_num varchar2(13),
	address varchar2(240),
	gender varchar2(6),
	java_score number(3),
	input_date date
);

--테이블 구조보기
desc student;

insert into student values(1,'강','A','kang@sist.co.kr','010-1234-5678','경기도 용인시','남자',91,sysdate);
   commit;
insert into student values(2,'박기범','A','park@daum.co.kr','010-7739-9761','서울시 강남구 역삼1동','남자',90,sysdate);
   commit;
insert into student values(3,'송준희','A','song@test.co.kr','010-5878-8813','서울시 동작구 상성도동 ','여자',97,sysdate);
   commit;
insert into student values(4,'이학민','B','lee@google.co.kr','010-234-7611','서울시 동대문구 동대문동','여자',190,sysdate);
   commit;
insert into student values(5,'한상민','B','hansang@sist.co.kr','010-4334-7656','인천시 부평구 부평3동','여자',89,sysdate);
   commit;

 
--delete from student;

-- 3번
select *
from student;

-- 4번
select name,class,address,java_score
from student;

-- 5번
update student
set gender = '남자', java_score = 90, class ='A', phone_num ='010-2234-7611'
where num = 4;

-- 6번
update student
set class ='A', phone_num ='010-1111-2341'
where name = '한상민';

--7번
delete from student
where class ='A';

--8번
rollback;

--9번
DROP TABLE student;

-- 휴지통 보기
-- show recyclebin

-- 휴지통 비우기
-- purge recyclebin

-- 휴지통에 있는 테이블 살리기
flashback table student to before drop;

-- 10번
truncate table student;

-- 11번
drop table student;

-- 12번
-- show recyclebin
purge recyclebin;









