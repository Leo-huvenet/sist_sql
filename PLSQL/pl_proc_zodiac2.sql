-- �̸�, �¾�ظ� �Է¹޾�, print output�� �ϸ� 'ȫ�浿�� �¾�� 2021��
-- ��� xx��'�� ����ϴ� PL/SQL�� �ۼ�


create or replace procedure proc_zodiac2(name varchar2, birth number,
	output_msg out varchar2)
	is

		ani_num number;
	  ani varchar(30);

	begin

	  ani_num := mod(birth,12);
		if ani_num = 0 then
		ani := '������';
		elsif ani_num = 1 then
		ani := '��';
		elsif ani_num = 2 then
		ani := '��';
		elsif ani_num = 3 then
		ani := '����';
		elsif ani_num = 4 then
		ani := '��';
		elsif ani_num = 5 then
		ani := '��';
		elsif ani_num = 6 then
		ani := 'ȣ����';
		elsif ani_num = 7 then
		ani := '�䳢';
		elsif ani_num = 8 then
		ani := '��';
		elsif ani_num = 9 then
		ani := '��';
		elsif ani_num = 10 then
		ani := '��';
		elsif ani_num = 11 then
		ani := '��';
		end if;

		output_msg := name||'�� �¾�� '||birth||'�� ��� '||ani||'��';

end;
/
