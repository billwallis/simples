drop table if exists orders;
drop table if exists order_lines;

create table orders (
    order_id integer primary key,
    order_ts datetime
);
create table order_lines (
    order_id integer,
    order_line_id integer,
    item varchar(100),
    primary key (order_id, order_line_id)
);

insert into orders (order_id, order_ts)
values
    (1, '2026-06-01 10:00:00'),
    (2, '2026-06-02 15:00:00'),
    (3, '2026-06-03 21:00:00')
;
insert into order_lines (order_id, order_line_id, item)
values
    (1, 1, 'foo'),
    (1, 2, 'bar'),
    (2, 1, 'foo'),
    (2, 2, 'bar'),
    (2, 3, 'baz'),
    (3, 1, 'qux')
;

select * from orders;
select * from order_lines;


insert into orders (order_id, order_ts)
values
    (null, '2026-06-04 09:00:00')
;


select table_name, column_name, is_nullable
from information_schema.columns
where table_name in ('orders', 'order_lines')
order by table_name, ordinal_position
;
