
resource "tls_private_key" "tls-private-key" {
  algorithm = "RSA"
}

resource "aws_key_pair" "key-pair" {
  key_name   = "keypair"
  public_key = tls_private_key.tls-private-key.public_key_openssh
  tags = {
    Name = "keypair"
  }
}
# Creates and stores ssh key used creating an EC2 instance
resource "aws_secretsmanager_secret" "secretsmanager-01-gehad" {
  name = "secretsmanager-gehad-prod"
}

resource "aws_secretsmanager_secret_version" "example" {
  secret_id     = aws_secretsmanager_secret.secretsmanager-01-gehad.id
  secret_string = tls_private_key.tls-private-key.private_key_pem
}

#EC2-bastion

resource "aws_instance" "bastion-01" {

 instance_type = "t2.micro"
 ami = "ami-004b73b0102ad2eee" # (Ubuntu)
 subnet_id = module.network.public-subnet-01-id
 security_groups = [aws_security_group.public-security-group.id]
 key_name = aws_key_pair.key-pair.key_name
 disable_api_termination = false
 ebs_optimized = false
 root_block_device {
 volume_size = "100"
 }
 tags = {
 "Name" = "${var.name}-bastion-01-G"
 }

 provisioner "local-exec" {
    command = "echo bastion-01 ${self.public_ip} >> public_ips.txt"
  }

   depends_on = [ module.network.vpc-01-id, module.network.igw-id, aws_db_instance.rds-gehad ]

    user_data = <<EOF
    #!/bin/sh
    sudo apt-get update
    sudo apt-get install -y mysql-client
    echo ${aws_db_instance.rds-gehad.address} >/tmp/dbdomain.txt
    sudo mv /tmp/dbdomain.txt /dbdomain.txt
    EOF
}

#EC2-application

resource "aws_instance" "application-01" {
 instance_type = "t2.micro"
 ami = "ami-004b73b0102ad2eee" # (Ubuntu)
 subnet_id = module.network.private-subnet-01-id
 security_groups = [aws_security_group.private-security-group.id]
 key_name = aws_key_pair.key-pair.key_name
 disable_api_termination = false
 ebs_optimized = false
 root_block_device {
 volume_size = "100"
 }
 tags = {
 "Name" = "${var.name}-application-01-G"
 }
}

