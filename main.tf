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
  key_name = "aws-key"

  tags = {
    Name = "frontend"
  }
}

resource "aws_instance" "backend_app_server" {
  ami           = "ami-091b8df234926413f"
  instance_type = "t2.micro"
  key_name = "aws-key"
  tags = {
    Name = "backend"
  }
}

resource "aws_key_pair" "aws-key" {
  key_name   = "aws-key"
  public_key = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQC7LhhH1sqVLQ7TNBJSHCEEo+YnOLhETxXPcIkxy1SDzQ3pBr4Z5lHCalld0xnwQrx0TXV2A6RopieUZMo0ki/LB/d76Hq3q4+wKn/zkmu5qqUsl0vpaNSz8+oUI+7Wm6onR731psa7IYWE9uucL9LH2TmRz5okDOFDXJNoGRO+1Yk20EllTJn9BiWu4ixYPYDN7LSvsYyyFPsoAJZ3ZMajiLEN95h7zvZz5uv1zQFAHOT1LVrpcyTmRq4Nr1LPzLaFVmRKX5KISqvylBVUecWUj1N/yW1XzimoQh18iQKb9Xh+d7PbLAiFig6PeYIBmcm7iIpa5CEqSxYsTO09MLzCREzlxuGAzIiDLmGgKIuBO55FelxCju/a8lvb9EhzMrPNcAPXBpuUenV81wz14+uxaai8Pf4k8+wLPlSRXfWubFiDBGkVHXKuvbaYvvVz9NR5/8XzDFf/JkQ6Ffztr+tLZJDzyVhqU1nBYrH/qU1WFWxUC9hHpaklyWNQmWv2PFE= nmiah@nmiah1-mac"
}
