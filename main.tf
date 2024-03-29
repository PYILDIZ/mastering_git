resource "aws_launch_template" "project_template" {
  name_prefix   = "project_template"
  image_id      = "ami-1a2b3c"
  instance_type = "t2.micro"
}

resource "aws_autoscaling_group" "project_asg" {
  availability_zones = ["us-east-1a"]
  desired_capacity   = 1
  max_size           = 1
  min_size           = 1

  launch_template {
    id      = aws_launch_template.project_template.id
    version = "$Latest"
  }
}