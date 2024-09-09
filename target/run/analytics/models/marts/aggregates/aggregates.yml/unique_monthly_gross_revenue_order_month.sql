select
      count(*) as failures,
      count(*) != 0 as should_warn,
      count(*) != 0 as should_error
    from (
      
    
    

select
    order_month as unique_field,
    count(*) as n_records

from analytics.dbt_lleon.monthly_gross_revenue
where order_month is not null
group by order_month
having count(*) > 1



      
    ) dbt_internal_test