/* -------------------------------------------------------
Set your environment variables to run this script

AWS_ACCESS_KEY_ID = ""
AWS_SECRET_ACCESS_KET = ""

--------------------------------------------------------- */

provider = "aws" {
	region = "us-east-1"
}

terraform {
	backend "s3" {
		bucket = "bucket-name-here"
		key = "prod"
		region = "us-east-1"

		skip-credentials_validation = true
		profile = "default"
	}
}

module "PRODUCTION" {
	source = "./env/PRODUCTION"
}

