create table CB_DEPOSIT_PRODUCTS(
id number generated always as identity primary key,
currency_id number,
product_name varchar2(100),
term number(4),
interest_rate number(10,2)
);

create or replace procedure add_depo_product(
d_currency_id number,
d_product_name varchar2,
d_term number,
d_interest_rate number
)
is begin 
insert into CB_DEPOSIT_PRODUCTS(currency_id,product_name,term,interest_rate)
values(d_currency_id,d_product_name,d_term,d_interest_rate);
commit;
end;

create or replace procedure update_depo_product(
d_id number,
d_currency_id number default null,
d_product_name varchar2 default null,
d_term number default null,
d_interest_rate number default null
)
is begin 
update CB_DEPOSIT_PRODUCTS set
currency_id=nvl(d_currency_id,currency_id),
product_name=nvl(d_product_name,product_name),
term=nvl(d_term,term),
interest_rate=nvl(d_interest_rate,interest_rate);
commit;
end;

begin 
add_depo_product(1,'novruz emaneti',3,1.7);
end;


select * from CB_DEPOSIT_PRODUCTS;






