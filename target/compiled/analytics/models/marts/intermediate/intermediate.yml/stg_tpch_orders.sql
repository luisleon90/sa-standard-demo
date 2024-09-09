
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