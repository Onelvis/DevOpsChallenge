resource "aws_instance" "main"{
    ami = "ami-05394aef61908afaa"
    instance_type = "t2.micro"

    tags = {
        Name = "devops-challenge-ec2"
    }
}