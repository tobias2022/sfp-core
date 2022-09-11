module "network" {
    source             = "./modules/network"
    name               = var.name
    environment        = var.environment
    cidr               = var.cidr
    private_subnets    = var.private_subnets
    public_subnets     = var.public_subnets
    availability_zones = var.availability_zones
}

module "sg" {
    source         = "./modules/sg"
    name           = var.name
    vpc_id         = module.network.vpc # /network/output.tf
    environment    = var.environment
    container_port = var.container_port
}

module "alb" {
    source              = "./modules/alb"
    name                = var.name
    vpc_id              = module.network.vpc
    subnets             = module.network.public_subnets
    environment         = var.environment
    alb_security_groups = [module.sg.alb]
    # alb_tls_cert_arn    = var.tsl_certificate_arn
    health_check_path   = var.health_check_path
}

module "ecs" {
    source                      = "./modules/ecs"
    name                        = var.name
    environment                 = var.environment
    region                      = var.region 
    subnets                     = module.network.private_subnets
    aws_alb_target_group_arn    = module.alb.aws_alb_target_group_arn
    ecs_service_security_groups = [module.sg.ecs_tasks]
    container_port              = var.container_port
    container_cpu               = var.container_cpu
    container_memory            = var.container_memory
    service_desired_count       = var.service_desired_count
    container_image             = var.container_image
}

module "mongodb" {
    source                               = "./modules/mongodb"
    name                                 = var.name
    environment                          = var.environment
    mongodb_atlas_org_id                 = var.mongodb_atlas_org_id
    mongodb_atlas_accesslistip           = var.mongodb_atlas_accesslistip
    mongodb_atlas_database_username      = var.mongodb_atlas_database_username
    mongodb_atlas_database_user_password = var.mongodb_atlas_database_user_password
    mongodb_atlas_api_pub_key            = var.mongodb_atlas_api_pub_key
    mongodb_atlas_api_pri_key            = var.mongodb_atlas_api_pri_key
}

