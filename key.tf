resource "tls_private_key" "adi_key" {
  algorithm = "RSA"
  rsa_bits  = 4096
}

resource "local_file" "private_key_pem" {
  content  = tls_private_key.adi_key.private_key_pem
  filename = "${path.module}/adi-key.pem"
}

resource "aws_key_pair" "adi_keypair" {
  key_name   = "adi-key"
  public_key = tls_private_key.adi_key.public_key_openssh
}
