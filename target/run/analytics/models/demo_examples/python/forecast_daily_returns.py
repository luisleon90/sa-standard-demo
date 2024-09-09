
  
    
import pandas as pd # import packages
from prophet import Prophet

def model( dbt, session ):
    
    dbt.config(
        materialized="table", # the incremental materialization is also supported
        packages=['pandas==1.5.3','Prophet','holidays==0.18'] # how to import python libraries in dbt's context
    )

    # use historical data to fit model
    df = dbt.ref("agg_daily_returned_orders").to_pandas() # use dbt.ref to reference other models in your dbt project
    df.columns = df.columns.str.lower()
    m = Prophet()
    m.fit(df)
    
    # forecast returns and output dataframe
    future = m.make_future_dataframe(periods=365)
    df = m.predict(future)
    
    return df # return final dataset via data frame. This is required. 

# The Preview button in the IDE is disabled, but you can iterate by building the object and then opening a new tab and running... select * from ref('forecast_daily_returns')
# Tests and Documentation can also be applied to python models, in the same manner as sql models (.yml file or custom tests).


# This part is user provided model code
# you will need to copy the next section to run the code
# COMMAND ----------
# this part is dbt logic for get ref work, do not modify

def ref(*args, **kwargs):
    refs = {"agg_daily_returned_orders": "analytics.dbt_lleon.agg_daily_returned_orders"}
    key = '.'.join(args)
    version = kwargs.get("v") or kwargs.get("version")
    if version:
        key += f".v{version}"
    dbt_load_df_function = kwargs.get("dbt_load_df_function")
    return dbt_load_df_function(refs[key])


def source(*args, dbt_load_df_function):
    sources = {}
    key = '.'.join(args)
    return dbt_load_df_function(sources[key])


config_dict = {}


class config:
    def __init__(self, *args, **kwargs):
        pass

    @staticmethod
    def get(key, default=None):
        return config_dict.get(key, default)

class this:
    """dbt.this() or dbt.this.identifier"""
    database = "analytics"
    schema = "dbt_lleon"
    identifier = "forecast_daily_returns"
    
    def __repr__(self):
        return 'analytics.dbt_lleon.forecast_daily_returns'


class dbtObj:
    def __init__(self, load_df_function) -> None:
        self.source = lambda *args: source(*args, dbt_load_df_function=load_df_function)
        self.ref = lambda *args, **kwargs: ref(*args, **kwargs, dbt_load_df_function=load_df_function)
        self.config = config
        self.this = this()
        self.is_incremental = False

# COMMAND ----------

# To run this in snowsight, you need to select entry point to be main
# And you may have to modify the return type to text to get the result back
# def main(session):
#     dbt = dbtObj(session.table)
#     df = model(dbt, session)
#     return df.collect()

# to run this in local notebook, you need to create a session following examples https://github.com/Snowflake-Labs/sfguide-getting-started-snowpark-python
# then you can do the following to run model
# dbt = dbtObj(session.table)
# df = model(dbt, session)


def materialize(session, df, target_relation):
    # make sure pandas exists
    import importlib.util
    package_name = 'pandas'
    if importlib.util.find_spec(package_name):
        import pandas
        if isinstance(df, pandas.core.frame.DataFrame):
          session.use_database(target_relation.database)
          session.use_schema(target_relation.schema)
          # session.write_pandas does not have overwrite function
          df = session.createDataFrame(df)
    
    df.write.mode("overwrite").save_as_table('analytics.dbt_lleon.forecast_daily_returns', table_type='transient')

def main(session):
    dbt = dbtObj(session.table)
    df = model(dbt, session)
    materialize(session, df, dbt.this)
    return "OK"

  