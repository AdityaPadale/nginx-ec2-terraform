output "public_ip" {
  value = aws_instance.nginx-web-server.public_ip
}
