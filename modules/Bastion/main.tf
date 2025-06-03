resource "aws_security_group" "SG_bastion" {
    tags = {
    	Name = "Bastion_SG"
    }
    name = "Security Group Bastion Host"
    description = "Security Group Bastion Host"
}


resource "aws_vpc_security_group_ingress_rule" "SG_Bastion_ingress1" {
  security_group_id = aws_security_group.SG_bastion.id
  cidr_ipv4 = "0.0.0.0/0"
  ip_protocol = "tcp"
  from_port = 22
  to_port = 22
}

resource "aws_vpc_security_group_egress_rule" "SG_Bastion_egress1" {
  security_group_id = aws_security_group.SG_bastion.id
  cidr_ipv4 = "0.0.0.0/0"
  ip_protocol = "tcp"
  from_port = 443
  to_port = 443
}

resource "aws_vpc_security_group_egress_rule" "SG_Bastion_egress2" {
  security_group_id = aws_security_group.SG_bastion.id
  cidr_ipv4 = data.aws_vpc.vpc.cidr_block
  ip_protocol = "-1"
}

resource "aws_instance" "bastion" {   
    tags = {
        Name = "BastianHost"
    }
    ami = data.aws_ssm_parameter.ami.value
    instance_type = var.instance_type
    key_name = var.key_name
    vpc_security_group_ids = [aws_security_group.SG_bastion.id]
    subnet_id = data.aws_subnet.PublicSub1.id
}

