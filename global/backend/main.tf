

resource "aws_s3_bucket" "devtfbucket" {
  bucket = "devbucketdevops"
  acl    = "private"

  versioning {
    enabled = true
  }
}

resource "aws_dynamodb_table" "tftable" {
  name             = "tftable"
  billing_mode   = "PROVISIONED"
  read_capacity  = 20
  write_capacity = 20
  hash_key       = "UserId"

  attribute {
    name = "UserId"
    type = "S"
  }
}