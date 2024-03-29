variable "AWS_REGION" {
  default = "us-east-1"
}
variable "PATH_TO_PRIVATE_KEY" {
  default = "/Users/baludevulapalli/Docker-ecr/mykey"
}
variable "PATH_TO_PUBLIC_KEY" {
  default = "/Users/baludevulapalli/Docker-ecr/mykey.pub"
}
variable "ECS_INSTANCE_TYPE" {
  default = "t2.micro"
}
variable "ECS_AMIS" {
  type = "map"
  default = {
    us-east-1 = "ami-02ca3cadbcb293e21"
    us-west-2 = "ami-033a024887b09d8a8"
    eu-west-1 = "ami-c8337dbb"
  }
}
