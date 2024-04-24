resource "aws_glue_catalog_database" "catalog-database" {
  name = "catalog-database"
}

resource "aws_glue_catalog_table" "aws_glue_catalog_table" {
  name          = "data-mesh-base-catalog-table-films"
  database_name = "catalog-database"

  table_type = "EXTERNAL_TABLE"

  parameters = {
    EXTERNAL              = "TRUE"
    "parquet.compression" = "SNAPPY"
  }

  storage_descriptor {
    location      = "${aws_s3_bucket.dev-data-mesh.bucket}/data/sw_data_films.parquet"

    columns {
      name = "title"
      type = "string"
    }

    columns {
      name = "episode_id"
      type = "int"
    }
    columns {
      name    = "opening_crawl"
      type    = "string"
      comment = ""
    }

    columns {
      name    = "director"
      type    = "string"
      comment = ""
    }

    columns {
      name    = "producer"
      type    = "string"
      comment = ""
    }
    columns {
      name    = "release_date"
      type    = "date"
      comment = ""
    }

    columns {
      name    = "characters"
      type    = "string"
      comment = ""
    }

    columns {
      name    = "planets"
      type    = "string"
      comment = ""
    }
    columns {
      name    = "starships"
      type    = "string"
      comment = ""
    }

    columns {
      name    = "vehicles"
      type    = "string"
      comment = ""
    }

    columns {
      name    = "species"
      type    = "string"
      comment = ""
    }
    columns {
      name    = "created"
      type    = "date"
      comment = ""
    }

    columns {
      name    = "edited"
      type    = "date"
      comment = ""
    }

    columns {
      name    = "url"
      type    = "int"
      comment = ""
    }
  }
}