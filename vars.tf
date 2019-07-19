variable "AWS_REGION" {
  default = "us-west-2"
}
variable "PATH_TO_PRIVATE_KEY" {
  default = "/Users/baludevulapalli/Docker-ecr/mykey"
}
variable "PATH_TO_PUBLIC_KEY" {
  default = "/Users/baludevulapalli/Docker-ecr/mykey.pub"
}
variable "ECS_INSTANCE_TYPE" {
  default = "t2.mirco"
}
variable "ECS_AMIS" {
  type = "map"
  default = {
      us-west-2 = "ami-082b5a644766e0e6f"
  }
}