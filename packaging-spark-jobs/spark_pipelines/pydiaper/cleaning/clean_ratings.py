from pyspark.sql import SparkSession
from pyspark.sql.types import *

from pydiaper.data_catalog.catalog import catalog


def main():
    spark = SparkSession.builder.getOrCreate()
    schema = StructType([
        StructField("brand", StringType(), False),
        StructField("model", StringType(), True),
        StructField("absorption_rate", ByteType(), True),
        StructField("comfort", ByteType(), True)
    ])
    frame = (spark.read
             .options(header="true")
             .schema(schema)
             .csv(catalog["landing/ratings"]))

    (frame
     .repartition(2)  # force 2 partitions for Data Camp, MC question
     .write
     .parquet(catalog["clean/ratings"], mode="overwrite")
     )


if __name__ == "__main__":
    main()
