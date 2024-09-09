
  create or replace   view analytics.dbt_lleon.agg_daily_returned_orders
  
   as (
    with fct_order_items as (
    select * from analytics.dbt_lleon.fct_order_items
),

final as (
    select
        fct_order_items.order_date as ds
        , cast(1.0*count(case when is_return then order_item_key else null end) as float) as y
    from fct_order_items
    group by 1
    order by 1 desc
)

select * from final
  );

