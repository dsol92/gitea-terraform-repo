resource "aws_lb_target_group" "tg" {
 name     = "target-group-a"
 port     = 3000
 protocol = "HTTP"
 vpc_id   = aws_vpc.new_env.id
}

resource "aws_lb_target_group_attachment" "tg_atachment" {
 target_group_arn = aws_lb_target_group.tg.arn
 target_id        = aws_instance.test_env_ec2.id
 port             = 3000
}

 
resource "aws_lb" "new_alb" {
name               = "my-alb"
internal           = false
load_balancer_type = "application"
security_groups    = ["${aws_security_group.new_sg_alb.id}"]
subnets            = ["${aws_subnet.subnet-a.id}","${aws_subnet.subnet-b.id}"]
}

resource "aws_lb_listener" "alb_listener" {
 load_balancer_arn = aws_lb.new_alb.arn
 port              = "8080"
 protocol          = "HTTP"

 default_action {
   type             = "forward"
   target_group_arn = aws_lb_target_group.tg.arn
 }
}
