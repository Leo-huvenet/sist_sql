-- �¾�ظ� ������ �����ϰ�, ������ ����Ͽ� ���̱��ϱ�
-- ����⵵ - �¾�� + 1 = ����
set serveroutput on

declare
	 -- ������ ����
   birth_year char(4);
   now_year char(4);
begin
	 -- �� �Ҵ�
	 birth_year := 1998;
	 now_year := to_char(sysdate, 'yyyy');

	 dbms_output.put_line('�¾��'|| birth_year || '�� ���� '||
	 								(now_year - birth_year + 1)|| '��');

	 -- Error : ���迬���ڴ� ����� �� ����.
	 dbms_output.put_line(3>2);
end;
/
