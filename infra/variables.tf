variable "name" {
  description = "the name of your stack, e.g. \"demo\""
}

variable "environment" {
  description = "the name of your environment, e.g. \"prod\""
}

variable "region" {
}

variable "availability_zones" {
  description = "a comma-separated list of availability zones, defaults to all AZ of the region, if set to something other than the defaults, both private_subnets and public_subnets have to be defined as well"
}

variable "cidr" {
  description = "The CIDR block for the VPC."
}

variable "public_subnets" {
  description = "a list of CIDRs for public subnets in your VPC, must be set if the cidr variable is defined, needs to have as many elements as there are availability zones"
}

variable "private_subnets" {
  description = "a list of CIDRs for private subnets in your VPC, must be set if the cidr variable is defined, needs to have as many elements as there are availability zones"
}

variable "service_desired_count" {
  description = "Number of tasks running in parallel"
}

variable "container_port" {
  description = "The port where the Docker is exposed"
}

variable "container_image" {
  description = "The image name where the Docker is used"
}

variable "container_cpu" {
  description = "The number of cpu units used by the task"
}

variable "container_memory" {
  description = "The amount (in MiB) of memory used by the task"
}

variable "health_check_path" {
  description = "Http path for task health check"
}

variable "mongodb_atlas_api_pub_key" {
}

variable "mongodb_atlas_api_pri_key" {
}

variable "mongodb_atlas_org_id" {
}

variable "mongodb_atlas_database_username" {
}

variable "mongodb_atlas_database_user_password" {
}

variable "mongodb_atlas_accesslistip" {
}
variable "database_name" {
}

variable "access_key" {
  type = string
}

variable "secret_key" {
  type = string
}

