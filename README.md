# RabbitMQ Failover Cluster - AWS



		These terraform scripts contains an implementation of a RabbitMQ failover cluster 
on AWS. Before applying the terraform scripts,
	1. Create a security group for nodes as the requirement
	2. Update the varibales in the variables.tf file as suitable
			node_ami - AMI for cluster nodes
			instance_type - Instance type of cluster nodes
			key - Key pair for login to the nodes
			sunbet - Subnet Id to create the cluster 
			security_group - Security group for the cluster 




Aqquire AWS Credentials			
			
```
export AWS_ACCESS_KEY_ID='XXXXXXXXXXXXXXXXXXXXXXXXXX'
export AWS_SECRET_ACCESS_KEY='YYYYYYYYYYYYYYYYYYYYYY' 
```			

			

Run Terraform Scripts

```
terraform init
terraform plan
terraform apply 
```


Tear down the cluster

```
terraform destroy
```


