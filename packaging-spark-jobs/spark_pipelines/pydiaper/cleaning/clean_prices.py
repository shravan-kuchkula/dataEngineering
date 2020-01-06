from pyspark.sql import SparkSession
from pyspark.sql.types import *

from pydiaper.data_catalog.catalog import catalog


def main():
    spark = SparkSession.builder.getOrCreate()
    schema = StructType([
        StructField("store", StringType(), False),
        StructField("countrycode", StringType(), False),
        StructField("brand", StringType(), False),
        StructField("model", StringType(), True),
        StructField("price", FloatType(), False),
        StructField("currency", StringType(), True),
        StructField("quantity", IntegerType(), True),
        StructField("date", DateType(), False),

    ])
    frame = (spark.read
             .options(header="true")
             .schema(schema)
             .csv(catalog["landing/prices"]))

    # No more cleaning actions required.

    (frame
     .repartition(2)  # force 2 partitions for DataCamp, MC question
     .write
     .parquet(catalog["clean/prices"], mode="overwrite"))


if __name__ == "__main__":
    main()
