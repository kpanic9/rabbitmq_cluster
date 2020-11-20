output "rabbitmq_master_ip" {
  description = "RabbitMQ master node IP"
  value       = aws_instance.rabbitmq_master.private_dns
}

output "rabbitmq_slave_ip" {
  description = "RabbitMQ slave node IP"
  value       = aws_instance.rabbitmq_slave.private_dns
}
