with source as (

    select * from raw.tpch_now.lineitem

),

renamed as (

    select
    
        md5(cast(coalesce(cast(l_orderkey as TEXT), '_dbt_utils_surrogate_key_null_') || '-' || coalesce(cast(l_linenumber as TEXT), '_dbt_utils_surrogate_key_null_') as TEXT))
                as order_item_key,
        l_orderkey as order_key,
        l_partkey as part_key,
        l_suppkey as supplier_key,
        l_linenumber as line_number,
        l_quantity as quantity,
        l_extendedprice as extended_price,
        l_discount as discount_percentage,
        l_tax as tax_rate,
        
        case 
            when l_returnflag in ('R') then 'returned'
            when l_returnflag in ('A') then 'accepted'
            else 'unknown'
        end as return_flag, 

        case 
            when return_flag = 'accepted' then false
            else true
        end as is_return,

        case l_linestatus 
            when 'P' then 'returned'
            when 'F' then 'billed'
            when 'O' then 'shipped'
            else null
        end as status_code,
        
        l_shipdate as ship_date,
        l_commitdate as commit_date,
        l_receiptdate as receipt_date,
        l_shipinstruct as ship_instructions,
        l_shipmode as ship_mode,
        l_comment as comment

    from source

)

select * from renamed