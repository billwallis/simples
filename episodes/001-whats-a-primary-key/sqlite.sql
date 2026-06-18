/*    SQLite 3.51    */
select sqlite_version();


/* Need to include `not null`! */
create table orders (
    order_id int not null primary key,
    order_ts datetime
);


select *, rowid from orders;

create table foo (bar text not null primary key);
insert into foo values ('a');
insert into foo values ('c');
insert into foo values ('b');
select *, rowid from foo;  /* same for composite PKs */
