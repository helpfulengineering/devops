variable "region" { default = "us-east-1" }
variable "subnet_id_az" {}
variable "vpc_id" { default = "your-vpc-id-here" }
variable "key_name" {}
variable "termination-protection" { default = true } #may need to set to false to run tf destroy command
variable "cloud-watch" { default = true }
variable "KMS_KEY_ID" {}
variable "security_group_Helpful_Enginner_default_linux" {}
variable "security_group_Helpful_Enginner_default_windows" {}
variable "Security-Group-name" {}

# These are for tags in the instance for meta info, maintance, billing, etc.
variable "Application" {}
variable "Environment" {}
variable "SoftwareTeam" {}
variable "SoftwareTeamLead" {}