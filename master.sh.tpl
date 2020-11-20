#!/bin/bash 

yum update -y

cat << EOT > /etc/yum.repos.d/rabbitmq-erlang.repo
[rabbitmq-erlang]
name=rabbitmq-erlang
baseurl=https://dl.bintray.com/rabbitmq/rpm/erlang/21/el/7
gpgcheck=1
gpgkey=https://dl.bintray.com/rabbitmq/Keys/rabbitmq-release-signing-key.asc
repo_gpgcheck=0
enabled=1
EOT
yum install erlang -y

rpm --import https://www.rabbitmq.com/rabbitmq-release-signing-key.asc
cat << EOT > /etc/yum.repos.d/rabbitmq.repo
[bintray-rabbitmq-server]
name=bintray-rabbitmq-rpm
baseurl=https://dl.bintray.com/rabbitmq/rpm/rabbitmq-server/v3.7.x/el/7/
gpgcheck=0
repo_gpgcheck=0
enabled=1
EOT
yum install rabbitmq-server -y

systemctl start rabbitmq-server
systemctl stop rabbitmq-server
echo "SHZSIFOZJFZAUZNSYGTI" > /var/lib/rabbitmq/.erlang.cookie
systemctl start rabbitmq-server 

rabbitmqctl stop_app
rabbitmqctl reset

slave=`echo ${slave-node} | awk -F '.' '{print $1}'`
a=`rabbitmqctl join_cluster rabbit@$slave`
echo $a >> /tmp/a 

rabbitmqctl start_app
