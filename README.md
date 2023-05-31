The infrastructure consists of 5 modules (vpc-subnets-instances-load balancers-remote backend) that provision the infrastructure as follows:

✅The infrastructure comprises a Virtual Private Cloud (VPC) and an Internet gateway to enable Internet access for EC2 instances.

✅It encompasses two public and two private EC2 instances, along with one public and one private load balancer.

✅The public load balancer consists of a target group containing the two public EC2 instances which are configured with Nginx as a proxy to redirect traffic to the private load balancer.


✅The private load balancer, on the other hand, includes a target group comprising the two private EC2 instances with Apache installed.

✅For enhanced state management and coordination, the Terraform configuration is set to employ a remote backend utilizing an S3 bucket with versioning enabled to store multiple versions of the Terraform state file. Additionally, a DynamoDB table is utilized to control resource locking.

![infrastructure](https://github.com/0xZe/Terraform-AWS-Infrastructure/assets/81789671/9db19177-53ea-40b2-9935-2abd763035af)
