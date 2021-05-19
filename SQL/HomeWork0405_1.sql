--¼÷Á¦1
CREATE OR REPLACE procedure proc_car(i_model car_maker.model%type, num number, cur_car1 out sys_refcursor)
is

	A NUMBER;
	B NUMBER;

begin

	if num = 1 then
	A := 1;
	B := 10;
	elsif num = 2 then
	A := 11;
	B := 20;
	elsif num = 3 then
	A := 21;
	B := 30;
	end if;

	open cur_car1 for
		select HIREDATE_rank, COUNTRY, MAKER, MODEL, CAR_YEAR, PRICE, CAR_OPTION
		from(select row_number() over(order by cmd.HIREDATE desc) HIREDATE_rank,
        		cc.COUNTRY, cc.MAKER, cmk.MODEL, cmd.CAR_YEAR, cmd.PRICE, cmd.CAR_OPTION
		 		from   CAR_COUNTRY cc, CAR_MAKER cmk, CAR_MODEL cmd
		 		where (cmk.MAKER = cc.MAKER AND cmd.MODEL = cmk.MODEL)
           		 AND cmk.MODEL = i_MODEL
				 )
		WHERE HIREDATE_rank BETWEEN A AND B;

end;
/