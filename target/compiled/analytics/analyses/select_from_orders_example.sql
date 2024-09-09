SELECT order_key, 
       order_date, 
       
     gross_item_sales_amount,
     item_discount_amount,
     item_tax_amount,
     net_item_sales_amount 
FROM analytics.dbt_lleon.fct_orders