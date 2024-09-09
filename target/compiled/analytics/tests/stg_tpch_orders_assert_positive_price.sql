

with orders as ( select * from analytics.dbt_lleon.stg_tpch_orders )

select *
from   orders 
where  total_price < 0