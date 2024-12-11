terraform {
  cloud { 
    
    organization = "ACME_Corporation" 

    workspaces { 
      name = "AWS-VCS" 
    } 
  } 
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.16"
    }
  }

  required_version = ">= 1.2.0"
}

provider "aws" {
  region  = "eu-west-2"
}

resource "aws_instance" "frontend_app_server" {
  ami           = "ami-091b8df234926413f"
  instance_type = "t2.micro"
  key_name = "aws-mac3"
  vpc_security_group_ids = [aws_security_group.secgroup.id]
  tags = {
    Name = "frontend-vcs"
  }
}

resource "aws_instance" "backend_app_server" {
  ami           = "ami-091b8df234926413f"
  instance_type = "t2.micro"
  key_name = "aws-mac3"
  vpc_security_group_ids = [aws_security_group.secgroup.id]
  tags = {
    Name = "backend-vcs"
  }
}

resource "aws_security_group" "secgroup" {
  name  = "secgroup"

  # Enable ssh server connection:
  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
}
