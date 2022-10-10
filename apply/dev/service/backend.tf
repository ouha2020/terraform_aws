terraform {
  backend "s3" {
    bucket = "devbucketdevops"
    key    = "apply/dev/service/terraform-service.ftstate"
    region = "ap-northeast-1"
  }
}
