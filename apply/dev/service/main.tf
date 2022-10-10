provider "aws" {
  region = "ap-northeast-1"
}

data "terraform_remote_state" "network" {
  backend = "s3"
  config = {
    bucket = "devbucketdevops"
    key    = "apply/dev/network/terraform-network.ftstate"
    region = "ap-northeast-1"
  }
}

locals {
  ami               = "ami-03f4fa076d2981b45"
  instance_type     = "t2.micro"
  vpc_id            = data.terraform_remote_state.network.outputs.vpcId
  subnet_id         = data.terraform_remote_state.network.outputs.subnetId
  security_group_id = data.terraform_remote_state.network.outputs.securityGroupId


  instance          = ["ec1", "ec2"]
  instance_config = {
    ec1 = {
      ipv4_address      = "10.0.1.10"
      availability_zone = "ap-northeast-1a"
      subnet_id         = local.subnet_id[0]
    },
    ec2 = {
      ipv4_address      = "10.0.10.10"
      availability_zone = "ap-northeast-1c"
      subnet_id         = local.subnet_id[1]
    },
  }

  
  ecs_ids = [for k, v in aws_instance.web : v.id]
  
}
