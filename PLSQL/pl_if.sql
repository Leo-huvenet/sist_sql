-- ���� if
-- �̸��� �Է¹޾� �̸��� '������' ��� �̸��տ� '����'�� �ٿ� ����ϰ�
-- �׷��� ������ �Է¹��� �̸��� ���

set serveroutput on
set verify off
-- �̸��� �Է¹޵��� �޽����� ����
accept name prompt ' �̸��Է� : '

declare
	--���� ����
	name varchar2(30) := '&name';
	num number;
begin

	if name = '������' then
		dbms_output.put('����');
	end if;

	dbms_output.put_line( name );

	-- num������ �� �Ҵ�
	num := -10;
	-- num������ ���� ���밪 ó��(������ ����� ��ȯ)
	if num < 0 then
		num := -num;
	end if;
	-- num������ ���
	dbms_output.put_line( num );
	-- abs()�Լ��� ����Ͽ��� �ȴ�.

	-- �Է¹��� �̸��� �ѻ��, �ڱ��, �̿���, ����� �̶�� �̸� �������
	-- '����'�� �ٿ� ����Ѵ�. �׷��� ������ �̸��� ���
	if name in('�ѻ��','�ڱ��','�̿���','�����')then
		dbms_output.put( '���� ' );
	end if;
		dbms_output.put_line( name );

end;
/

