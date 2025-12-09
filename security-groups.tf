
  

# Security Group for EC2 Application Server
resource "aws_security_group" "app_sg" {
  name   = "app-sg"
  

  # Allow HTTP only from ALB
  ingress {
    from_port       = 80
    to_port         = 80
    protocol        = "tcp"
   
     cidr_blocks = ["0.0.0.0/0"]
  }

  # SSH for admin
  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "app-sg"
  }
}
