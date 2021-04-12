terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
    }
  }
}

provider "aws" {
  profile = "terraform-bn"
  region  = "us-east-1"
}

module "sitemap_onS3" {
source               = "./sitemap_onS3hosting"
route53_hosting_zone = "jondryk.space"
root_domain_name     = "public.jondryk.space"
bucket_name          = "staging-bn-public"
common_tags          = {
    Name        = "ENV"
    Environment = "staging"
}
}