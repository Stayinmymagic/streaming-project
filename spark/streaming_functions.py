from pyspark.sql import SparkSession
from pyspark.sql.functions import from_json, month, hour, dayofmonth, col, year, udf

def create_or_get_spark_session(app_name, master = "yarn"):
    spark = (SparkSession
             .builder
             .appName(app_name)
             .master(master=master)
             .getOrCreate())
    return spark

