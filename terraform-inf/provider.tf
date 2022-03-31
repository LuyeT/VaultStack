provider "aws" {
  profile = "Luye"
  region  = "eu-central-1"
}

terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.8.0"
    }

    #  backend "s3" {
    #    bucket = "Luye_tf_bucket"
    #    key    = "state"
    #  }
  }
}


module "sec_groups" {
  source = "./sec_groups/"
}
