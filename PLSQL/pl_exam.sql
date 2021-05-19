set serveroutput on
-- �ֹι�ȣ�� �Է¹޾� ��ȿ���� ����ϴ� PL/SQL �ۼ�
/*
	1. �ֹι�ȣ�� 14�ڸ��̿����Ѵ�. (14�ڸ��� �ƴϸ� '�ڸ����� Ȯ��'�� ���)
	2. �ֹι�ȣ�� '880101-1234567' �������� 7��° �ڸ��� '-' �־���Ѵ�.
		 (7��° �ڸ��� '-'�� �ƴϸ� '������ Ȯ��'�� ���)
	1���� 2�����ǿ� ���յǸ� ������ �����Ѵ�.
	3. �ֹι�ȣ ���ϱ�
		880101-1234567
		3-1 ���ڸ��� 2,3,4,5,6,7,8,9,2,3,4,5�� ���� ���� ���Ѵ�.
		3-2 3-1���� �߻����� 11�� ���� �������� ���Ѵ�.
		3-3 11���� 3-2�� �߻��� ���� ����.
		3-4 3-3���� �߻��� ���� 10�� ������������ ���Ѵ�.
		3-5 3-4���� �߻��� ���� �ֹι�ȣ�� ���� �������ڸ��� ���ٸ� '��ȿ'
				�׷��� �ʴٸ� '��ȿ'�� ���.
*/
set verify off

accept rsn prompt '�ֹι�ȣ �Է� : '

declare
	rsn varchar2(30) := '&rsn';
	rsn_sum number := 0;
	rsn_flag number := 2;
	
begin

	if length(rsn) != 14 then
		
		dbms_output.put_line('�ڸ����� Ȯ��');
	elsif(instr(rsn, '-') != 7) then
		dbms_output.put_line('������ Ȯ��');
	else
		for i in 1..length(rsn)-1 loop
			if i != 7 then
				rsn_sum := rsn_sum + substr(rsn,i,1) * rsn_flag;
				rsn_flag := rsn_flag+1;

				if rsn_flag = 10 then
					rsn_flag := 2;
				end if;

			end if;
		end loop;
    
			if substr(rsn,14,1) = mod(11 - mod(rsn_sum,11),10) then
				dbms_output.put_line('��ȿ');
			else
				dbms_output.put_line('��ȿ');
			end if;
  end if;
end;
/
