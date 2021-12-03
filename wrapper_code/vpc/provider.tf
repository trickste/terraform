terraform {
  required_version = "= 1.0.11"
}

provider "aws" {
  region  = "ap-south-1"
  profile = "default"
}