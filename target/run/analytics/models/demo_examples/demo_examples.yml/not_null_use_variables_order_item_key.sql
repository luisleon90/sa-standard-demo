select
      count(*) as failures,
      count(*) != 0 as should_warn,
      count(*) != 0 as should_error
    from (
      
    
    



select order_item_key
from analytics.dbt_lleon.use_variables
where order_item_key is null



      
    ) dbt_internal_test