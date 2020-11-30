resource "aws_instance" "web"{
    ami = "ami-09558250a3419e7d0 "
    instance_type = "t2.micro"

    tags = {
        name = "dc-sample"
    }
}

resource "aws_security_group" "allow_connection"{
    name = "allow_connection"
    description = "Open ports: 8080"

    ingress = [ {
      description = "Inbound"
      from_port = 80
      protocol = "http"
      to_port = 80
    } ]
}