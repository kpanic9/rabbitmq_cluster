/*
 * Outputs:
 * 	1. ip address of master node
 * 	2. ip address of slave node
 */


#  
output "rabbitmq_master_ip" {
	value = "${aws_instance.rabbitmq_master.private_dns}"
}


#
output "rabbitmq_slave_ip" {
	value = "${aws_instance.rabbitmq_slave.private_dns}"
}