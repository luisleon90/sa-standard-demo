-- Build actual result given inputs
with dbt_internal_unit_test_actual as (
  select
    customer_key,tier_name, 'actual' as "actual_or_expected"
  from (
    

with  __dbt__cte__stg_tpch_customers as (

-- Fixture for stg_tpch_customers
select 
    
        try_cast('629' as NUMBER(38,0))
     as customer_key, try_cast(null as character varying(25)) as name, try_cast(null as character varying(40)) as address, try_cast(null as NUMBER(38,0)) as nation_key, try_cast(null as character varying(15)) as phone_number, try_cast(null as NUMBER(38,0)) as account_balance, try_cast(null as character varying(10)) as market_segment, try_cast(null as character varying(117)) as comment
union all
select 
    
        try_cast('4' as NUMBER(38,0))
     as customer_key, try_cast(null as character varying(25)) as name, try_cast(null as character varying(40)) as address, try_cast(null as NUMBER(38,0)) as nation_key, try_cast(null as character varying(15)) as phone_number, try_cast(null as NUMBER(38,0)) as account_balance, try_cast(null as character varying(10)) as market_segment, try_cast(null as character varying(117)) as comment
union all
select 
    
        try_cast('1' as NUMBER(38,0))
     as customer_key, try_cast(null as character varying(25)) as name, try_cast(null as character varying(40)) as address, try_cast(null as NUMBER(38,0)) as nation_key, try_cast(null as character varying(15)) as phone_number, try_cast(null as NUMBER(38,0)) as account_balance, try_cast(null as character varying(10)) as market_segment, try_cast(null as character varying(117)) as comment
union all
select 
    
        try_cast('26' as NUMBER(38,0))
     as customer_key, try_cast(null as character varying(25)) as name, try_cast(null as character varying(40)) as address, try_cast(null as NUMBER(38,0)) as nation_key, try_cast(null as character varying(15)) as phone_number, try_cast(null as NUMBER(38,0)) as account_balance, try_cast(null as character varying(10)) as market_segment, try_cast(null as character varying(117)) as comment
),  __dbt__cte__stg_tpch_orders as (

-- Fixture for stg_tpch_orders
select try_cast(null as NUMBER(38,0)) as order_key, 
    
        try_cast('629' as NUMBER(38,0))
     as customer_key, try_cast(null as character varying(1)) as status_code, 
    
        try_cast('163443' as NUMBER(38,0))
     as total_price, try_cast(null as DATE) as order_date, try_cast(null as character varying(15)) as priority_code, try_cast(null as character varying(15)) as clerk_name, try_cast(null as NUMBER(38,0)) as ship_priority, try_cast(null as character varying(79)) as comment
union all
select try_cast(null as NUMBER(38,0)) as order_key, 
    
        try_cast('4' as NUMBER(38,0))
     as customer_key, try_cast(null as character varying(1)) as status_code, 
    
        try_cast('4134568' as NUMBER(38,0))
     as total_price, try_cast(null as DATE) as order_date, try_cast(null as character varying(15)) as priority_code, try_cast(null as character varying(15)) as clerk_name, try_cast(null as NUMBER(38,0)) as ship_priority, try_cast(null as character varying(79)) as comment
union all
select try_cast(null as NUMBER(38,0)) as order_key, 
    
        try_cast('1' as NUMBER(38,0))
     as customer_key, try_cast(null as character varying(1)) as status_code, 
    
        try_cast('1428872' as NUMBER(38,0))
     as total_price, try_cast(null as DATE) as order_date, try_cast(null as character varying(15)) as priority_code, try_cast(null as character varying(15)) as clerk_name, try_cast(null as NUMBER(38,0)) as ship_priority, try_cast(null as character varying(79)) as comment
union all
select try_cast(null as NUMBER(38,0)) as order_key, 
    
        try_cast('26' as NUMBER(38,0))
     as customer_key, try_cast(null as character varying(1)) as status_code, 
    
        try_cast('418512' as NUMBER(38,0))
     as total_price, try_cast(null as DATE) as order_date, try_cast(null as character varying(15)) as priority_code, try_cast(null as character varying(15)) as clerk_name, try_cast(null as NUMBER(38,0)) as ship_priority, try_cast(null as character varying(79)) as comment
), customer as (
    select * from __dbt__cte__stg_tpch_customers
),

orders as (
    select * from __dbt__cte__stg_tpch_orders
),
final as (
    select
        customer.customer_key,
        sum(orders.total_price) as lifetime_value,
        case 
            when lifetime_value <= 200000 then 'tier1'
            when lifetime_value > 2000000 then 'tier2'
            when lifetime_value between 1000000 and 1999999 then 'tier3'
            when lifetime_value between 0 and 999999 then 'tier4' 
        end as tier_name
    from customer
        inner join orders
            on customer.customer_key = orders.customer_key
    group by 1
)

select * from final
  ) _dbt_internal_unit_test_actual
),
-- Build expected result
dbt_internal_unit_test_expected as (
  select
    customer_key, tier_name, 'expected' as "actual_or_expected"
  from (
    select 
    
        try_cast('629' as NUMBER(38,0))
     as customer_key, 
    
        try_cast('tier1' as character varying(16777216))
     as tier_name
union all
select 
    
        try_cast('4' as NUMBER(38,0))
     as customer_key, 
    
        try_cast('tier2' as character varying(16777216))
     as tier_name
union all
select 
    
        try_cast('1' as NUMBER(38,0))
     as customer_key, 
    
        try_cast('tier3' as character varying(16777216))
     as tier_name
union all
select 
    
        try_cast('26' as NUMBER(38,0))
     as customer_key, 
    
        try_cast('tier4' as character varying(16777216))
     as tier_name
  ) _dbt_internal_unit_test_expected
)
-- Union actual and expected results
select * from dbt_internal_unit_test_actual
union all
select * from dbt_internal_unit_test_expected