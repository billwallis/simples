/*    Microsoft SQL Server 17.0    */
select @@version;


/* What about clustered columnstores? */
select
    order_id,
    %%physloc%% as physloc,
    sys.fn_PhysLocFormatter(%%physloc%%) as file_page_slot
from orders
;

select object_id, name, type_desc, is_primary_key, is_unique
from sys.indexes
where object_id = object_id('orders')
;
