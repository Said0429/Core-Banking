create table cb_branches(
id number generated always as identity primary key,
name varchar2(30),
address varchar2(30)
);


create or replace procedure add_branches
(a_name varchar2,
a_address varchar2)
is begin
insert into cb_branches(name,address) 
values(a_name, a_address);
commit;
end;

create or replace procedure update_branches
(a_id number,
a_name varchar2 default null,
a_address varchar2 default null)
is begin
update cb_branches set 
name=nvl(a_name,name),
address=nvl(a_address,address)
where id=a_id;
commit;
end ;
