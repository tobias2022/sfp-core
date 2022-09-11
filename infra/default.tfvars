name = "ECS"

environment = "PROD"

region = "ap-southeast-2"

cidr = "10.0.0.0/16"

availability_zones = ["ap-southeast-2a", "ap-southeast-2b"]

public_subnets = ["10.0.1.0/24", "10.0.3.0/24"]

private_subnets = ["10.0.2.0/24", "10.0.4.0/24"]

service_desired_count = 1

container_port = 8080

container_image = "tobias2022/easycrm"

container_cpu = 256

container_memory = 512

health_check_path = "/"

mongodb_atlas_api_pub_key = "rxgwijvo"

mongodb_atlas_api_pri_key = "f93400fa-db93-454a-a59e-9d70890487a6"

mongodb_atlas_org_id = "617918e3c5beac1fe20c2fc4"

mongodb_atlas_database_username = "tobias"

mongodb_atlas_database_user_password = "Nk19950913"

mongodb_atlas_accesslistip = "129.78.56.151"

database_name = "crmdb"

