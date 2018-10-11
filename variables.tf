/*
 * Configuration Variables
 *
 *
 */


# ami of the cluster nodes
variable "node_ami" {
	default = ""
}


# aws instance type for nodes
variable "instance_type" {
	default = ""
}


# key pair name for logging into the cluster nodes
variable "key" {
	default = ""
}


# private subnet id to provision the cluster
variable "sunbet" {
	default = ""
}


# rabbitmq node security group
variable "security_group" {
	default = ""
}

