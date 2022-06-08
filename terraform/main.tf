
module "network"{
source = "./network"

name=var.name
env_region= var.env_region
private-subnet-01-cidr_block= var.private-subnet-01-cidr_block
private-subnet-02-cidr_block= var.private-subnet-02-cidr_block
public-subnet-01-cidr_block= var.public-subnet-01-cidr_block
public-subnet-02-cidr_block= var.public-subnet-02-cidr_block
vpc-01-cidr-block= var.vpc-01-cidr-block

}