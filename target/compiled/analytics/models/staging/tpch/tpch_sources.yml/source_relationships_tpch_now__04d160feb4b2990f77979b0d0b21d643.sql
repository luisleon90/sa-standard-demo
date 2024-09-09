
    
    

with child as (
    select o_custkey as from_field
    from raw.tpch_now.orders
    where o_custkey is not null
),

parent as (
    select c_custkey as to_field
    from raw.tpch_sf001.customer
)

select
    from_field

from child
left join parent
    on child.from_field = parent.to_field

where parent.to_field is null


