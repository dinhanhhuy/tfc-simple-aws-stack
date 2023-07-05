provider "aws" {
  region = "ap-southeast-1"
}

data "aws_ami" "linux" {
  owners      = ["self"]  # Change to the list of AWS account IDs if the AMI is owned by different accounts
  most_recent = true
  filter {
    name   = "image-id"
    values = ["ami-0c91f4476780c2eaf"]
  }
}

resource "aws_instance" "web" {
  ami           = "${data.aws_ami.linux.id}"
  instance_type = "t2.micro"

  tags = {
    Name = "HelloWorld"
  }
}