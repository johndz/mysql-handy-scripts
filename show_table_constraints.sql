set @tablename := "jd_test" ;
set @schemaname := "dzdb" ;

select
    table_name, ordinal_position , column_name, constraint_name ,
    ifnull( referenced_table_name , "") as  referenced_table_name       ,
    ifnull( referenced_column_name, "" ) as referenced_column_name
from
    information_schema.key_column_usage
where
    table_schema = @schemaname
    and ( table_name = @tablename  or referenced_table_name = @tablename  )

order by constraint_name , ordinal_position
;
