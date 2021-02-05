terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 2.70"
    }
  }
}

provider "aws" {
  region     = "us-west-2"
  access_key = "AKIA3Y7YQ5AJ6EI32PWO"
  secret_key = "1UOZMQitNCEVE0V9Oyg11XwJfcgNvZCOJtufXEbk"
}

resource "aws_instance" "example_a" {
  ami           = "ami-830c94e3"
  instance_type = "t2.micro"
  tags = {
    Name = "Hello World 1st EC2 Instance"
  }
}

resource "aws_instance" "server" {
  count = 4 # create four similar EC2 instances

  ami           = "ami-a1b2c3d4"
  instance_type = "t2.micro"

  tags = {
    Name = "Server ${count.index}"
  }
}