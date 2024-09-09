select
      count(*) as failures,
      count(*) != 0 as should_warn,
      count(*) != 0 as should_error
    from (
      

with orders as ( select * from analytics.dbt_lleon.stg_tpch_orders )

select *
from   orders 
where  total_price < 0
      
    ) dbt_internal_test