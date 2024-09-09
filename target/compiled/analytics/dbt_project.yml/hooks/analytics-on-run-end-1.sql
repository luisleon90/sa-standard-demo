
  
    grant usage on schema dbt_lleon to role transformer;
    grant select on all tables in schema dbt_lleon to role transformer;
    grant select on all views in schema dbt_lleon to role transformer;
    grant select on future tables in schema dbt_lleon to role transformer;
    grant select on future views in schema dbt_lleon to role transformer;
  
