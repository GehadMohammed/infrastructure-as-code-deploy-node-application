resource "null_resource" "out" {
  triggers = {
    always_run = "${timestamp()}"
  }
  provisioner "local-exec" {
    command = "echo  ${aws_instance.application-01.private_ip} > private-ip.txt"
  }
  
   provisioner "local-exec" {
    command = "echo ${aws_instance.bastion-01.public_ip} > public-ip.txt"
  }

    provisioner "local-exec" { # Create a "myKey.pem" to your computer!!
    command = "echo '${tls_private_key.tls-private-key.private_key_pem}' > /var/jenkins_home/.ssh/BastionKey.pem"
  }
  
}