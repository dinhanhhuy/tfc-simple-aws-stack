provider "aws" {
  region = "ap-southeast-1"
}

resource "aws_instance" "web" {
  ami           = "ami-0c91f4476780c2eaf"
  instance_type = "t2.micro"

  tags = {
    Name = "HelloWorld"
  }
}