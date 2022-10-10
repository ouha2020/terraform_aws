terraform {
  backend "s3" {
    bucket = "devbucketdevops"
    key    = "apply/dev/network/terraform-network.ftstate"
    region = "ap-northeast-1"
  }
}
