
resource "aws_key_pair" "deployer" {
  key_name   = "deployer-key"
  public_key = file("${path.module}/config/ecs_public.pub")
}

resource "aws_instance" "web" {

  for_each                    = toset(local.instance)
  ami                         = local.ami
  instance_type               = local.instance_type
  key_name                    = aws_key_pair.deployer.key_name
  associate_public_ip_address = true
  subnet_id                   = local.instance_config[each.value].subnet_id
  availability_zone           = local.instance_config[each.value].availability_zone
  private_ip                  = local.instance_config[each.value].ipv4_address
  vpc_security_group_ids      = [local.security_group_id]


  user_data = file("${path.module}/config/install.sh")

  tags = {
    Name = each.value
  }
}
