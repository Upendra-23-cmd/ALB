terraform {
    required_providers {
        aws = {
        source  = "hashicorp/aws"
        version = "~> 4.0"
        }
    }
}

provider "aws" {
    region = "us-east-1"
  
}

module "my_vpc" {
    source = "./modules/vpc"
  
}

module "my_asg" {
    source = "./modules/asg"
    vpc_id = module.my_vpc.vpc_id
    launch_template_id = module.template.template_id
    subnet_ids = module.my_vpc.subnet_id
    target_group_arns = [module.alb.target_group_arn]
}

module "alb" {
  source = "./modules/alb"
    vpc_id = module.my_vpc.vpc_id
    security_groups = [module.template.my_sg]
    subnet_ids = module.my_vpc.subnet_id
}

module "template" {
    source = "./modules/template"
    subnet_id = module.my_vpc.subnet_id
    vpc_id = module.my_vpc.vpc_id
}