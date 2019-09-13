provider "aws" {
  version = "~> 2.7"
  region = "${var.AWS_REGION}"
  profile = "user"
  shared_credentials_file = "/Users/baludevulapalli/.aws/credentials"
}
