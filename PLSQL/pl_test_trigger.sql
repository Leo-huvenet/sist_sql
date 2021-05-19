-- trigger 선언

create or replace trigger test_trigger
after insert or update or delete on test_trigger1
for each row
declare

begin

	-- triggering event 비교
	if inserting then
		-- 추가되기전 이전값 :old.컬럼은 값이 존재하지 않으나
		-- 추가된 이후의 값 :new.컬럼명은 값이 존재한다.
		dbms_output.put_line('추가 작업수행 이전 값 : '|| :old.name
			||' / 이후 값 : ' || :new.name );
	end if;

	if updating then
	   -- 변경되기전의 :old.컬럼명과 변경된 이후의 :new.컬럼명 모두 존재하나
	   -- 값이 다르다.
		dbms_output.put_line('변경 작업수행 이전 값 : '|| :old.name
			||' / 이후 값 : ' || :new.name );
	end if;
   
	if deleting then
	  -- 변경되기 전에 :old.컬럼명은 존재하나, 변경된 이후의 :new.컬렴명은
		-- 삭제된 이후이기 때문에 값이 존재하지 않는다.
		dbms_output.put_line('삭제 작업수행 이전 값 : '|| :old.name
			||' / 이후 값 : ' || :new.name );
	end if;

end;
/
