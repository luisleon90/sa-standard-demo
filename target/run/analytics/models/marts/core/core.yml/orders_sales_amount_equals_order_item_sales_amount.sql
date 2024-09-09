select
      count(*) as failures,
      count(*) != 0 as should_warn,
      count(*) != 0 as should_error
    from (
      
    with a as (
        
    select
        
        order_key as col_1,
        
        sum(net_item_sales_amount) as expression
    from
        analytics.dbt_lleon.fct_order_items
    
    group by
        1
        
    

    ),
    b as (
        
    select
        
        order_key as col_1,
        
        sum(net_item_sales_amount) as expression
    from
        analytics.dbt_lleon.fct_orders
    
    group by
        1
        
    

    ),
    final as (

        select
            coalesce(a.col_1, b.col_1) as col_1,
            
            a.expression,
            b.expression as compare_expression,
            abs(coalesce(a.expression, 0) - coalesce(b.expression, 0)) as expression_difference,
            abs(coalesce(a.expression, 0) - coalesce(b.expression, 0))/
                nullif(a.expression * 1.0, 0) as expression_difference_percent
        from
        
            a
            full outer join
            b on
            a.col_1 = b.col_1 
            
    )
    -- DEBUG:
    -- select * from final
    select
        *
    from final
    where
        
        expression_difference > 0.0
        
      
    ) dbt_internal_test