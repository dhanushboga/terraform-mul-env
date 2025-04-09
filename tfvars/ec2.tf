resource "aws_instance" "ec2-expense" {

  count = length(var.instance_name)
  # count = 3
  ami                    = data.aws_ami.ec2.id
  instance_type          = local.instance_type
  vpc_security_group_ids = local.vpc_security_group_ids

  # tags = {
  #   Name = var.instance_name[count.index]
  # }

  tags = merge(var.common_tags,
  {
    Name = "${var.project}-${var.environment}-${var.instance_name[count.index]}"
  }
  
  )
  

}

resource "aws_security_group" "allow-alls" {

  name        = "${var.project}-${var.environment}"   #expense-dev  #expense-prod
  description = "Allow the traffic to ec2-instance"
  tags        = {
    Name = "${var.project}-${var.environment}" 
  }

  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }

  ingress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }
}



# git filter-branch --tree-filter 'rm -rf .terraform' HEAD
# git log --oneline