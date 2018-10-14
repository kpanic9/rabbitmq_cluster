/*
 * Outputs
 *
 */

 
output "rabbitmq_master_ip" {
	value = "${aws_instance.rabbitmq_master.private_dns}"
}


output "rabbitmq_slave_ip" {
	value = "${aws_instance.rabbitmq_slave.private_dns}"
}
