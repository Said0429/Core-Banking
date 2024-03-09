create table CB_CUSTOMER_DEPOSITS(
id number generated always as identity primary key,
CUSTOMER_ID number,
DEPOSIT_PRODUCT_ID	NUMBER,
CONTRACT_NO	VARCHAR2(30),
DEPOSIT_AMOUNT	NUMBER(22,2),
PROFIT_AMOUNT	NUMBER(22,2),
START_DATE	DATE
);

create or replace procedure add_cust_depo
(cd_CUSTOMER_ID number,
cd_DEPOSIT_PRODUCT_ID	NUMBER,
cd_CONTRACT_NO	VARCHAR2,
cd_DEPOSIT_AMOUNT	NUMBER,
cd_PROFIT_AMOUNT	NUMBER,
cd_START_DATE	DATE
)
is begin
insert into CB_CUSTOMER_DEPOSITS(CUSTOMER_ID,DEPOSIT_PRODUCT_ID,CONTRACT_NO,DEPOSIT_AMOUNT,PROFIT_AMOUNT,START_DATE) 
values(cd_CUSTOMER_ID, cd_DEPOSIT_PRODUCT_ID,cd_CONTRACT_NO,cd_DEPOSIT_AMOUNT,cd_PROFIT_AMOUNT,cd_START_DATE);
commit;
end;


create or replace procedure update_cust_depo
(cd_id number,
cd_CUSTOMER_ID number default null,
cd_DEPOSIT_PRODUCT_ID number default null,
cd_CONTRACT_NO varchar2 default null,
cd_DEPOSIT_AMOUNT number default null,
cd_PROFIT_AMOUNT number default null,
cd_START_DATE date default null
)
is begin
update CB_CUSTOMER_DEPOSITS set 
CUSTOMER_ID=nvl(cd_CUSTOMER_ID,CUSTOMER_ID),
DEPOSIT_PRODUCT_ID=nvl(cd_DEPOSIT_PRODUCT_ID,DEPOSIT_PRODUCT_ID	),
CONTRACT_NO=nvl(cd_CONTRACT_NO,CONTRACT_NO),
DEPOSIT_AMOUNT=nvl(cd_DEPOSIT_AMOUNT,DEPOSIT_AMOUNT),
PROFIT_AMOUNT=nvl(cd_PROFIT_AMOUNT,PROFIT_AMOUNT),
START_DATE=nvl(cd_START_DATE,START_DATE)
where id=cd_id;
commit;
end ;


begin
add_cust_depo(1,1,'00001',100,0,sysdate);
end;

begin
update_cust_depo(1,cd_start_date=>sysdate-1);
end;
select * from CB_CUSTOMER_DEPOSITS;

