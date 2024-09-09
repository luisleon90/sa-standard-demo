
    
    

select
    part_supplier_key as unique_field,
    count(*) as n_records

from analytics.dbt_lleon.stg_tpch_part_suppliers
where part_supplier_key is not null
group by part_supplier_key
having count(*) > 1


