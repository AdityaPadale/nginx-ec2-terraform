

resource "aws_instance" "nginx-web-server" {
  
  ami = "ami-068c0051b15cdb816"
  instance_type = "t2.nano"
 
  key_name = aws_key_pair.adi_keypair.key_name

  vpc_security_group_ids = [aws_security_group.app_sg.id]

 user_data = <<-EOF
   #!/bin/bash

    yum update -y
    sudo yum install nginx -y
    sudo systemctl start nginx
   sudo systemctl enable nginx

  EOF

  tags = {
    Name = "nginx-web-server"
  }
}


