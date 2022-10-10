output "vpcId" {
  value = aws_vpc.main.id
}

output "subnetId" {
  value = aws_subnet.subnet.*.id
}

output "securityGroupId" {
  value = aws_security_group.allow.id
}

output "routeTableId"{
  value = data.aws_route_table.table.id
}