-- test_trigger1테이블에서 추가작업이 발생하면 test_trigger2테이블에
-- 동일 값을 추가하고,
-- test_trigger2테이블에서 변경작업이 발생하면 test_trigger2테이블에
-- 같은 값이 변경되도록 설정하고,
-- test_trigger1테이블에서 삭제작업이 발생하면 test_trigger2테이블에서도
-- 같은 값이 삭제도도록 trigger  구성

create or replace trigger test_trigger1
after insert or delete or update on test_trigger1
for each row
declare



begin
	-- insert의 비교
	if inserting then
	   -- test_trigger2 테이블에 동일 값을 추가
	   insert into test_trigger2(name,age) values ( :new.name, :new.age ) ;
-- 	 transaction을 처리할 수 없다.
--		 if sql%rowcount = 1 then
--		 	commit;
--		 end if;
	end if;

  -- update의 비교
	if updating then
		 update test_trigger2
		 set age = :new.age
		 where name = :new.name; -- old, new 둘 다 사용가능

	end if;

	-- delete의 비교
	if deleting then
		delete from test_trigger2 where name = :old.name;
	end if;

end;
/
