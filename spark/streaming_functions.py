from pyspark.sql import SparkSession
from pyspark.sql.functions import from_json, month, hour, dayofmonth, col, year, udf

def create_or_get_spark_session(app_name, master = "yarn"):
    spark = (SparkSession
             .builder
             .appName(app_name)
             .master(master=master)
             .getOrCreate())
    return spark

def create_kafka_read_stream(spark, address, port, topic, starting_offset="earliest"):
    """
    Returns:
        read_stream: DataStreamReader
    """
    read_stream = (spark
                   .readStream
                   .format("kafka")
                   .option("kafka.bootstrap.servers", f"{address}:{port}")
                   .option("failOnDataloss", False)
                   .option("startingOffsets", starting_offset)
                   .option("subscribe", topic)
                   .load())
    
    return read_stream
# try to execute and print readstream

def process_stream(stream, stream_schema, topic):
    
