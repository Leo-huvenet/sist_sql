-- sys_refcursor를 사용하여 조회
-- 제조국을 입력받아 제조사, 제조국, 모델명, 연식, 옵션을 조회하여 출력하는
-- PL/SQL작성

set serveroutput on
set verify off

accept country prompt '제조국 입력 : '

declare
	type car_rec is record(MAKER varchar2(10), COUNTRY char(6),
			MODEL varchar2(30), CC number(5), CAR_OPTION varchar2(4000));

	cd car_rec;
	
	car_cur sys_refcursor;

begin

	open car_cur for
		select cc.MAKER, COUNTRY, cmk.MODEL, CC, CAR_OPTION
		from car_country cc, car_maker cmk, car_model cmd
		where (cmk.maker(+) = cc.maker and cmd.model(+) = cmk.model)
					AND COUNTRY = '&country';

	loop

		fetch car_cur into cd;
		exit when(car_cur%notfound);

		dbms_output.put_line(cd.MAKER||'/'||cd.COUNTRY||'/'||cd.MODEL||'/'||cd.CC||'/'||cd.CAR_OPTION);

		end loop;

		close car_cur;
		
end;
/


