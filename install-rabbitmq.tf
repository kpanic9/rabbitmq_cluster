/*
 * RabbitMQ Failover Cluster 
 * 
 *
 */




provider "aws" {
  region = "us-west-1"
}




# provisioning the rabbitmq slave node 
data "template_file" "rabbitmq-slave" {
  template = "${file("./slave.sh.tpl")}"
}

resource "aws_instance" "rabbitmq_slave" {
  ami             = "${var.node_ami}"
  instance_type   = "${var.instance_type}"
  key_name        = "${var.key}"
  subnet_id       = "${var.sunbet}"
  security_groups = ["${var.security_group}"]
  user_data       = "${data.template_file.rabbitmq-slave.rendered}"

  tags {
    Name = "rabbitmq-slave"
  }
}




# provisioning the rabbitmq master node 
data "template_file" "rabbitmq-master" {
  template = "${file("./master.sh.tpl")}"

  vars {
    slave-node = "${aws_instance.rabbitmq_slave.private_dns}"
  }
}

resource "aws_instance" "rabbitmq_master" {
  ami             = "${var.node_ami}"
  instance_type   = "${var.instance_type}"
  key_name        = "${var.key}"
  subnet_id       = "${var.sunbet}"
  security_groups = ["${var.security_group}"]
  user_data       = "${data.template_file.rabbitmq-master.rendered}"

  depends_on = ["aws_instance.rabbitmq_slave"]

  tags {
    Name = "rabbitmq-master"
  }
}


