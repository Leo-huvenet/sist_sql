-- ���� �Է¹޾� 'Ȧ��'���� '¦��'���� ����ϴ� �ڵ�
set serveroutput on
set verify off

accept num prompt '�� �Է� : '
accept name prompt '�̸� �Է� : '

declare
	num number := &num;
	--�Է¹��� �̸��� ������ ���� ����
	name varchar(30) := '&name';
begin

	dbms_output.put(num||'��(��) ');

	if mod(num,2) = 0 then
		dbms_output.put_line('¦��');
	else
	  dbms_output.put_line('Ȧ��');
	end if;

	-- �̸��� '������'��� '����'�� ����ϰ�, �׷��� ������ '���'�� ����� ��
	-- �̸��� ���
	if name = '������' then
		dbms_output.put_line(' ����');
	else
	  dbms_output.put_line('��� '|| name);
	end if;

end;
/
