-- trigger ����

create or replace trigger test_trigger
after insert or update or delete on test_trigger1
for each row
declare

begin

	-- triggering event ��
	if inserting then
		-- �߰��Ǳ��� ������ :old.�÷��� ���� �������� ������
		-- �߰��� ������ �� :new.�÷����� ���� �����Ѵ�.
		dbms_output.put_line('�߰� �۾����� ���� �� : '|| :old.name
			||' / ���� �� : ' || :new.name );
	end if;

	if updating then
	   -- ����Ǳ����� :old.�÷���� ����� ������ :new.�÷��� ��� �����ϳ�
	   -- ���� �ٸ���.
		dbms_output.put_line('���� �۾����� ���� �� : '|| :old.name
			||' / ���� �� : ' || :new.name );
	end if;
   
	if deleting then
	  -- ����Ǳ� ���� :old.�÷����� �����ϳ�, ����� ������ :new.�÷Ÿ���
		-- ������ �����̱� ������ ���� �������� �ʴ´�.
		dbms_output.put_line('���� �۾����� ���� �� : '|| :old.name
			||' / ���� �� : ' || :new.name );
	end if;

end;
/
