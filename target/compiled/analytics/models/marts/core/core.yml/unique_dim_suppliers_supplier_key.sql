
    
    

select
    supplier_key as unique_field,
    count(*) as n_records

from analytics.dbt_lleon.dim_suppliers
where supplier_key is not null
group by supplier_key
having count(*) > 1


