#private ec2 instances

resource "aws_instance" "private_ec2s" {
  count           = 2
  ami             = data.aws_ami.amazon_linux.image_id
  instance_type   = var.ec2_type
  subnet_id       = var.private_subnets_id[count.index]
  security_groups = [aws_security_group.sg.id]

  user_data = <<-EOF
    #!/bin/bash

    yum update -y
     yum install -y httpd.x86_64
    systemctl start httpd.service
    systemctl enable httpd.service
        
    tee -a /var/www/html/index.html <<EOF
    <!DOCTYPE html>
    <html>
    <head>
    <style>
    body {
    margin-left: 200px;
    background: #D3D3D3 url('https://www.iti.gov.eg/assets/images/iti-logo.png') no-repeat top left;
        }

        .center_div {
        border: 1px solid gray;
        margin-left: auto;
        margin-right: auto;
        width: 90%;
        background-color: #d0f0f6;
        text-align: left;
        padding: 8px;
        }
        </style>
        </head>
        <body>

        <div class="center_div">
        <h1>Hello ITI from $(hostname -f)</h1>
        <p>This indicates that we are in the private machine and load balancer works!!!</p>
        </div>

        </body>
        </html>
        EOF



}