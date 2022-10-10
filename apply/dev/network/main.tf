provider "aws" {
  region ="ap-northeast-1"
}

locals {
  azs       = ["ap-northeast-1a", "ap-northeast-1c"]
  cidrblock = ["10.0.1.0/24", "10.0.10.0/24"]
  ports = ["22","80","443"]
}