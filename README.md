# RabbitMQ Failover Cluster - AWS

This terraform module contains an implementation of a RabbitMQ failover cluster 
on AWS. 
Before applying the terraform scripts,
1. Create a security group for nodes as the requirement
2. Update the varibales in the variables.tf file as suitable    
	ami_id         - AMI for cluster nodes   
	instance_type  - Instance type of cluster nodes    
	key            - Key pair for login to the nodes   
	sunbet         - Subnet Id to create the cluster    
	security_group - Security group for the cluster    

### Aqquire AWS Credentials			
		 	
```
export AWS_ACCESS_KEY_ID='XXXXXXXXXXXXXXXXXXXXXXXXXX'
export AWS_SECRET_ACCESS_KEY='YYYYYYYYYYYYYYYYYYYYYY' 
```			
     
### Run Terraform Scripts
       
```
terraform init
terraform plan
terraform apply 
```
        
### Outputs
        
1. RabbitMQ master node IP address
2. RabbitMQ slave node IP address
    
### Tear down the cluster
     
```
terraform destroy
```
