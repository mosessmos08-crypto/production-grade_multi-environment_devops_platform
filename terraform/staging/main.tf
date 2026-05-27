module "network" {
 source = "../modules/network"
}

module "ec2" {

    source = "../modules/ec2"
    subnet_id = module.network.subnet_id
    sg_id = module.network.sg_id
  
}

terraform {
  backend "s3" {
    bucket         = "terraform-info-buck"
    key            = "staging/terraform.tfstate"
    region         = "ap-south-1"
    dynamodb_table = "multi-env-db"
  }
}