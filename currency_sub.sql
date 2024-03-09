create table cb_currency(
id number generated always as identity primary key,
name varchar2(30),
code varchar2(30)
);


create or replace procedure add_currency
(c_name varchar2,
c_code varchar2)
is begin
insert into cb_currency(name,code) 
values(c_name, c_code);
commit;
end;


create or replace procedure update_currnecy
(c_id number,
c_name varchar2 default null,
c_code varchar2 default null)
is begin
update cb_currency set 
name=nvl(c_name,name),
code=nvl(c_code,code)
where id=c_id;
commit;
end ;


begin
add_currency('AZN','CODE');
end;
select * from cb_currency;

