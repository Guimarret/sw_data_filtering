CREATE EXTERNAL TABLE IF NOT EXISTS `sw_db_athena`.`films_query` (
  `title` string,
  `episode_id` bigint,
  `opening_crawl` string,
  `director` string,
  `producer` string,
  `release_date` string,
  `characters` "array<string>",
  `planets` "array<string>",
  `starships` "array<string>",
  `vehicles` "array<string>",
  `species` "array<string>",
  `created` string,
  `edited` string,
  `url` string
) 
ROW FORMAT SERDE 'org.apache.hadoop.hive.ql.io.parquet.serde.ParquetHiveSerDe' STORED AS INPUTFORMAT 'org.apache.hadoop.hive.ql.io.parquet.MapredParquetInputFormat' OUTPUTFORMAT 'org.apache.hadoop.hive.ql.io.parquet.MapredParquetOutputFormat' LOCATION 's3://dev-data-mesh/data/' TBLPROPERTIES (
  'classification' = 'parquet',
  'parquet.compression' = 'SNAPPY'
);