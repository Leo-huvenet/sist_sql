-- ������ �Է¹޾� ���������� ����
-- ������ 0�����۴ٸ� '0�����۾Ƽ� ����', ������ 100���� ũ�ٸ� '100���� Ŀ������'
-- �׷��� ������ '�Է¼���'�� ����ϴ� PL/SQL�ۼ�

set serveroutput on
set verify off

accept score prompt '�����Է� : '
accept brith prompt '�¾�� �Է� : '

declare

score number := &score;
brith number := 0;
flag number;
zodiac varchar2(9) ;


begin

dbms_output.put_line(score||'��');

if score < 0 then
	dbms_output.put_line('�� 0���� ���� �� �����ϴ�.');
else if score > 100 then
	dbms_output.put_line('�� 100���� Ŭ �� �����ϴ�.');
else
	dbms_output.put_line('�Է¼��� �Ͽ����ϴ�.');
end if;

-- �Է°��� 1890 ~ 2021�� ������ ��� ������ �Ҵ��ϰ�, �׷��� ������
-- '�츦 ������� �ʴ� �⵵�Դϴ�.'�� �����ش�.

-- ������ �Ҵ�� ��� �츦 ���Ͽ� ���
-- ������-0, ��-1, ��-2, ����-3, ��-4, ��-5, ȣ����-6, �䳢-7, ��-8, ��-9, ��-10, ��-11

	if &birth between 1890 and 2021 then
			 brith := &brith ;
		else
			dbms_output_put_line('�츦 ������� �ʴ� �⵵�Դϴ�.');
		end if;

	   if brith != 0 then
      flag := mod(brith, 12);

         if flag = 0 then
            zodiac := '������';

         elsif   flag = 1 then
            zodiac := '��';

         elsif   flag = 2 then
            zodiac := '��';

         elsif   flag = 3 then
            zodiac := '����';

         elsif   flag = 4 then
            zodiac := '��';

         elsif   flag = 5 then
            zodiac := '��';

         elsif   flag = 6 then
            zodiac := 'ȣ����';

         elsif   flag = 7 then
            zodiac := '�䳢';

         elsif   flag = 8 then
            zodiac := '��';

         elsif   flag = 9 then
            zodiac := '��';

         elsif   flag = 10 then
            zodiac := '��';

         else
            zodiac := '��';

       end if;

      dbms_output.put_line(zodiac);

   end if;

end;
/
