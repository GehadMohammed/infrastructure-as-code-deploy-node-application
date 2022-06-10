resource "aws_lb_target_group" "app_lb_tg" {
  name     = "app-lb-tg"
  port     = 3000
  protocol = "TCP"
  vpc_id   = module.network.vpc-01-id
}

resource "aws_lb_target_group_attachment" "app_lb_tg_att" {
  target_group_arn = aws_lb_target_group.app_lb_tg.arn
  target_id        = aws_instance.application-01.id
  port             = 3000
}


resource "aws_lb" "app_lb" {
  name               = "app-lb"
  internal           = false
  load_balancer_type = "network"
  subnets            = [ module.network.private-subnet-01-id , module.network.private-subnet-02-id ]
  
  tags = {
    Environment = "production"
  }
}

resource "aws_lb_listener" "app_lb_lestener" {
  load_balancer_arn = aws_lb.app_lb.arn
  port              = "80"
  protocol          = "TCP"

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.app_lb_tg.arn
  }
}