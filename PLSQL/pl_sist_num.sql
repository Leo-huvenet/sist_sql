-- �������� ����Ͽ� ���������� �����ϴ� �������� ���ڿ� ��ȯ�ϴ� �Լ�
-- Ű�� ����ϴ� ���
-- SIST_0000000001 �� �������� ��ȯ�Ǿ���Ѵ�.

create or replace function sist_num -- �Ű����� �Ұ�ȣ�� �Ű������� ���� ���� ���
return char
is
	temp_num varchar2(15);
begin

	temp_num := concat('SIST',lpad(seq_func.nextval,10,0));

	return temp_num;
end;
/




