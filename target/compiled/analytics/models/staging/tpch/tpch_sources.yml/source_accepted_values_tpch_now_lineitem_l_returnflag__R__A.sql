
    
    

with all_values as (

    select
        l_returnflag as value_field,
        count(*) as n_records

    from raw.tpch_now.lineitem
    group by l_returnflag

)

select *
from all_values
where value_field not in (
    'R','A'
)


