select
      count(*) as failures,
      count(*) != 0 as should_warn,
      count(*) != 0 as should_error
    from (
      
    
    



select nation_key
from analytics.dbt_lleon.fct_order_items
where nation_key is null



      
    ) dbt_internal_test