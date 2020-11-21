terraform {
  required_version = ">= 0.12, < 0.14"
}

provider "aws" {
  region = "us-east-1"

  # Allow any 2.x version of the AWS provider
  version = "~> 2.0"
}

resource "aws_instance" "app" {
  instance_type     = "t2.micro"
  availability_zone = "us-east-1a"
  ami               = "ami-08b277333b9511393"

  user_data = <<-EOF
              #!/bin/bash
              sudo service apache2 start
              EOF
}

