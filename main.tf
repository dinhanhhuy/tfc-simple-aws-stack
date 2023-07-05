provider "aws" {
  region = "ap-southeast-1"
}

data "aws_ami" "linux" {
  most_recent = true
  name_regex  = "ami-0c91f4476780c2eaf"
  owners      = ["amazon"]
}

resource "aws_instance" "web" {
  ami           = "${data.aws_ami.linux.id}"
  instance_type = "t2.micro"

  tags = {
    Name = "HelloWorld"
  }
}