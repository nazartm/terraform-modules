VPC module
==========

VPC module with 3 types of subnets: public, private and database in each availability zone.

Usage:

    module "vpc" {
        source = "../vpc"

        project          = "my-project"
        environment      = "prod"
        cidr             = "10.196.208.0/20"
        private_subnets  = ["10.196.209.0/24", "10.196.210.0/24", "10.196.211.0/24"]
        public_subnets   = ["10.196.212.0/24", "10.196.213.0/24", "10.196.214.0/24"]
        database_subnets = ["10.196.215.0/24", "10.196.216.0/24", "10.196.217.0/24"]
    }