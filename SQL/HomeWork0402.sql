create or replace function create_ssn(brith number, gender number)
return char
is
	ssn_num number;
	random_num number;
	ssn char(14);

	temp_num number := 0;
	flag_num number := 2;

begin

   random_num := trunc(dbms_random.value(100000,999999),0);
   ssn_num := concat(gender,random_num);

	 ssn := brith||'-'||ssn_num;

   if instr(ssn,'-') = 7 then
	 for i in 1..length(ssn)-1 loop
			if i != 7 then
			temp_num := temp_num + substr(ssn,i,1)*flag_num;

			flag_num := flag_num + 1;
				if flag_num = 10 then
					flag_num :=2;
			  end if;
		  end if;
	  end loop;

	temp_num := mod(11 - mod(temp_num,11),10);

				if temp_num = substr(ssn, 14) then
					return ssn;
				end if;
		end if;
end;
/
