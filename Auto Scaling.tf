resource "aws_autoscaling_group" "private_asg" {
  name                 = "private-asg"
  min_size             = 2
  max_size             = 4
  desired_capacity     = 2
  vpc_zone_identifier  = [aws_subnet.privatesubnet1a-App.id, aws_subnet.privatesubnet1b-App.id]
  launch_configuration = aws_launch_configuration.private_lc.name
}

resource "aws_autoscaling_policy" "private_scale_out" {
  name                   = "private-scale-out"
  scaling_adjustment     = 1
  adjustment_type        = "ChangeInCapacity"
  cooldown               = 300
  autoscaling_group_name = aws_autoscaling_group.private_asg.name
}

resource "aws_autoscaling_policy" "private_scale_in" {
  name                   = "private-scale-in"
  scaling_adjustment     = -1
  adjustment_type        = "ChangeInCapacity"
  cooldown               = 300
  autoscaling_group_name = aws_autoscaling_group.private_asg.name
}

resource "aws_autoscaling_attachment" "private_asg_attachment" {
  autoscaling_group_name = aws_autoscaling_group.private_asg.name
  lb_target_group_arn    = aws_lb_target_group.web_target_group.arn
}

