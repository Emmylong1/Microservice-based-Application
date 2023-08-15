#provider details
terraform {
  required_providers {
    aws = {
        source = "hashicorp/aws"
        version = "3.62.0"
    }
  }
}

provider "aws" {
    region = var.region
    access_key = "your-access-key"
    secret_key = "your-secret-key"
    # default_tags {
    #   tags = {
    #     Environment = "Testing"
    #     Name = "Provider tag"
    #   }
    # }
}