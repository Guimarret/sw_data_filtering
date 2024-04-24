resource "aws_athena_database" "sw_db_athena_core" {
  name   = "sw_db_athena"
  bucket = aws_s3_bucket.athena-db.id
}

resource "aws_athena_workgroup" "core-group" {
  name = "core-group"

  configuration {
    enforce_workgroup_configuration    = true
    publish_cloudwatch_metrics_enabled = true

    result_configuration {
      output_location = "s3://${aws_s3_bucket.dev-data-mesh.bucket}/core-search/"
    }
  }
}

resource "aws_athena_named_query" "base_films_query" {
  name      = "films"
  workgroup = aws_athena_workgroup.core-group.id
  database  = aws_athena_database.sw_db_athena_core.name
  query     = file("sql/films.sql") 
}

# resource "aws_athena_named_query" "base_planets_query" {
#   name      = "planets"
#   workgroup = aws_athena_workgroup.core-group.id
#   database  = aws_athena_database.sw_db_athena_core.name
#   query     = file("sql/planets.sql") 
# }

# resource "aws_athena_named_query" "base_people_query" {
#   name      = "people"
#   workgroup = aws_athena_workgroup.core-group.id
#   database  = aws_athena_database.sw_db_athena_core.name
#   query     = file("sql/people.sql") 
# }

# resource "aws_athena_named_query" "base_species_query" {
#   name      = "species"
#   workgroup = aws_athena_workgroup.core-group.id
#   database  = aws_athena_database.sw_db_athena_core.name
#   query     = file("sql/species.sql") 
# }

# resource "aws_athena_named_query" "base_starships_query" {
#   name      = "starships"
#   workgroup = aws_athena_workgroup.core-group.id
#   database  = aws_athena_database.sw_db_athena_core.name
#   query     = file("sql/starships.sql") 
# }

# resource "aws_athena_named_query" "base_vehicles_query" {
#   name      = "vehicles"
#   workgroup = aws_athena_workgroup.core-group.id
#   database  = aws_athena_database.sw_db_athena_core.name
#   query     = file("sql/vehicles.sql") 
# }