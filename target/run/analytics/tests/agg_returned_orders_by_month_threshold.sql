select
      count(*) as failures,
      count(*) != 0 as should_warn,
      count(*) != 0 as should_error
    from (
      

with agg_returned_orders_by_month as ( select * from analytics.dbt_lleon.agg_returned_orders_by_month )

select *
from agg_returned_orders_by_month
where order_month = (select max(order_month) from agg_returned_orders_by_month)
and return_rate > 0.60
      
    ) dbt_internal_test