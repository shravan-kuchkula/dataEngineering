from pyspark.sql import SparkSession
from pyspark.sql.functions import col

from ..data_catalog.catalog import catalog


def main():
    spark = SparkSession.builder.getOrCreate()
    retail_prices = spark.read.parquet(catalog["clean/prices"])
    ratings = spark.read.parquet(catalog["clean/ratings"])

    prices_with_ratings = retail_prices.join(ratings, ["brand", "model"])
    unit_prices_with_ratings = (prices_with_ratings
                                .withColumn("unit_price_in_euro",
                                            col("price") / col("quantity")))

    (unit_prices_with_ratings
     .filter((col("absorption_rate") >= 4) & (col("comfort") >= 3))
     .orderBy(col("unit_price_in_euro").asc())
     .limit(10)
     .repartition(1)
     .write
     .csv(catalog["business/top_n_diapers"]))


if __name__ == "__main__":
    main()
