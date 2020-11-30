resource "aws_instance" "web" {
  ami           = "ami-0a91cd140a1fc148a "
  instance_type = "t2.micro"

  tags = {
    name = "dc-sample"
  }
}

resource "aws_security_group" "instance" {
  name = "terraform-example-instance"

  # Inbound HTTP from anywhere
  ingress {
    from_port   = 5000
    to_port     = 5001
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
}
