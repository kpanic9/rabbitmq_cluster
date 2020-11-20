variable "ami_id" {
  description = "AMI ID to launch cluster nodes"
  type        = string
}

variable "instance_type" {
  description = "AWS instance type for nodes"
  type        = string
}

variable "key" {
  description = "EC2 key pair name for logging into the cluster nodes"
  type        = string
}

variable "sunbet" {
  description = "Private subnet id to provision the cluster"
  type        = string
}

variable "security_group" {
  description = "RabbitMQ node security group"
  type        = string
}

