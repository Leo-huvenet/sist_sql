-- procedure 생성 : 두수를 입력받아 더하기 연산결과를 out parameter에 할당하는 일
-- in parameter의 in은 생략할 수 있다.
create or replace procedure proc_plus( num1 number, num2 number,
	result out number, msg out varchar2)
	is

	begin

		-- out parameter는 procedure 안에서 처리한 결과를 procedure외부로 내보내기위해
		-- 존재하는 변수로 호출할 때 bind 변수를 할당하고, procedure안에서는
		-- PL/SQL과 다르게 :없이 사용한다.
		result := num1 + num2;

		msg := '오늘은 '||to_char(sysdate,'day')||' 입니다.';

	end;
	
	/*
	컴파일 : @파일명.sql
	에러확인 : show error
	
	바인드변수 선언
		var result number
		var msg varchar2(100)
	
	실행 : 
		exec [execute] 프로시저명( 값,,,);
		
		exec proc_plus(1, 2, :result, :msg);
		
		출력
		print result
		print msg
	*/