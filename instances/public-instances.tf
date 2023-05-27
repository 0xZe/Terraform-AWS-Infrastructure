#public ec2 instances

resource "aws_instance" "public_ec2s" {
  count           = 2
  ami             = data.aws_ami.amazon_linux.image_id
  instance_type   = var.ec2_type
  subnet_id       = var.public_subnets_id[count.index]
  security_groups = [aws_security_group.sg.id]

  user_data = <<-EOF
    #!/bin/bash
    sudo tee -a /home/ec2-user/nginx.conf <<EOF
events {
  worker_connections  4096;  ## Default: 1024
}
http {
 server {
   listen 80;
   listen [::]:80;
   keepalive_timeout 65s;

   server_name 10.x.x.x;

   location / {
    proxy_pass http://${var.internal_load_balancer_dns}:80;


   }
 }
}

  EOF


  key_name = "##########"

  provisioner "remote-exec" {
    inline = [
      #commands you want to exute

      "sudo yum update -y",
      "sudo amazon-linux-extras install nginx1 -y",
      "sudo systemctl enable nginx",
      "sudo systemctl start nginx",
      "sudo cp /home/ec2-user/nginx.conf /etc/nginx/nginx.conf",
      "sudo systemctl restart nginx"


    ]
  }
  connection {
    type        = "ssh"
    host        = self.public_ip
    user        = "ec2-user"
    private_key = file("#######")
    timeout     = "4m"
  }
  provisioner "local-exec" {
    command = "echo ${self.public_ip} >> ./all-ips.txt"
  }


}




