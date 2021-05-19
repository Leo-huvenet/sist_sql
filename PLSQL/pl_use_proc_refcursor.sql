-- procedure 생성
select * from user_procedures;

-- 바인드 변수의 선언
var r number;
var m varchar2(100);
-- 프로시저의 직접실행
execute proc_plus(11, 26, :r, :m);
-- 바인드 변수의 출력
print r
print m
----------------------------------------------------------
-- proc_zodiac
var msg varchar2(300);

exec proc_zodiac('이학민', 1997, :msg);

print msg;

----------------------------------------------------------
-- proc_zodiac2
var msg varchar2(300);

exec proc_zodiac2('유경우', 1998, :msg);

print msg;

----------------------------------------------------------
--동조회
-- 커서를 저장할 수 있는 데이터형을 사용하여 bind 변수 선언
var cur_zip refcursor;

-- 실행
exec proc_zipcode('', :cur_zip);

-- 출력
print cur_zip;
----------------------------------------------------------
--insert
select * from CP_EMP4;

var row_cnt number;
var msg varchar2(600);

-- procedure 실행
exec proc_insert(1235, '강인섭', 10, '주임', :row_cnt, :msg);
--out parameter에 존재하는 값 출력
print row_cnt;
print msg;

select * from cp_emp4;
----------------------------------------------------------
--bind 변수선언
var row_cnt number;
var msg varchar2(600);

--procedure 실행
exec proc_update(1235, '사원', 20, :row_cnt, :msg);

print row_cnt;
print msg;
----------------------------------------------------------
--bind 변수선언
var row_cnt number;
var msg varchar2(600);

--프로시저실행
exec proc_delete(1235, :row_cnt, :msg);

print row_cnt;
print msg;

----------------------------------------------------------
--프로시저 삭제
drop procedure proc_plus;

----------------------------------------------------------
-- 0405숙제 문제1
select * from CAR_MAKER;
select * from CAR_MODEL;

var CUR_CAR1 refcursor;

exec proc_car('K5',1, :cur_zip);

print cur_zip;

----------------------------------------------------------
-- 0405숙제 문제2
select * from CP_EMP3;

var row_cnt number;
var msg varchar2(600);

-- procedure 실행
exec proc_emp3(10000, '장경우', 'AQ', 2800, :row_cnt, :msg);
--out parameter에 존재하는 값 출력
print row_cnt;
print msg;

delete from cp_emp3




