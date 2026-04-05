variable "region" {
    description = "AWS region to deploy resources in"
    type       = string
    default     = "us-east-1"
}

variable "enviroment" {
    description = "Enviroment to deploy resources in"
    type       = string
    default     = "Custom vpc with public and private subnets"
 }

