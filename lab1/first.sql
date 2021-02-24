set SERVEROUTPUT ON FORMAT WRAPPED;

create or replace procedure info

is

	scheme varchar2(50) := 'ISU_UCHEB';
	tab_name varchar2(100) := 'Имя';
    columns_num varchar2(100) := 'Столбцов';
	strings_num varchar2(100) := 'Строк';
	name_len NUMBER := 50;
    col_len NUMBER := 20;
    str_len NUMBER := 20;
begin

  DBMS_OUTPUT.PUT_LINE('Схема: ' || scheme);
  DBMS_OUTPUT.PUT_LINE('');
  DBMS_OUTPUT.PUT_LINE(RPAD(tab_name, name_len) || ' ' || RPAD(columns_num,
col_len) || ' ' || RPAD(strings_num, str_len));
  DBMS_OUTPUT.PUT_LINE(RPAD('-', name_len, '-') || ' ' || RPAD('-', col_len, '-')
|| ' ' || RPAD('-', str_len, '-'));



	select table_name  into tab_name from all_tables where owner = :scheme;
	select count(*) into columns_num from all_tab_columns where table_name =: tab_name ;
	select num_rows  into strings_num from all_tables where owner =: scheme;
	DBMS_OUTPUT.PUT_LINE(RPAD(tab_name, name_len) || ' ' || RPAD(columns_num, col_len) || ' ' || RPAD(strings_num, str_len));

end info;
/