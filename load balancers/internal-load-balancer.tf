#internal_target_group

resource "aws_lb_target_group" "internal_target_group" {
  name        = "internal-target-group"
  port        = 80
  protocol    = "HTTP"
  target_type = "instance"
  vpc_id      = var.appvpc_id

  health_check {
    path                = "/"
    protocol            = "HTTP"
    interval            = 10
    healthy_threshold   = 5
    unhealthy_threshold = 2
    timeout             = 5
  }
}
##############################################################################################

#Attach private ec2s to the internal target group

resource "aws_lb_target_group_attachment" "aws_lb_internal_target_group_attachment" {

  count            = 2
  target_id        = var.private_ec2s_id[count.index]
  target_group_arn = aws_lb_target_group.internal_target_group.arn
  port             = 80

}
#############################################################################################

#internal load balancer

resource "aws_lb" "internal_load_balancer" {
  name               = "internall-load-balancer"
  internal           = true
  load_balancer_type = "application"
  ip_address_type    = "ipv4"
  security_groups    = var.sg_id[0]
  subnets            = [var.private_subnets_id[0], var.private_subnets_id[1]]


}
################################################################################################

#internal load balancer listener 

resource "aws_lb_listener" "internal_load_balancer_listener" {
  load_balancer_arn = aws_lb.internal_load_balancer.arn
  port              = "80"
  protocol          = "HTTP"

  default_action {
    target_group_arn = aws_lb_target_group.internal_target_group.arn
    type             = "forward"
    forward {
      target_group {
        arn = aws_lb_target_group.internal_target_group.arn
      }
    }
  }
}