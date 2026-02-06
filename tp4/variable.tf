variable "instance_type" {
  type        = string
  description = "Type of EC2 instance"
  default     = "t3.micro"
}

variable "aws_common_tags" {
  type        = map(any)
  description = "Set aws tag"
  default = {
    NAME = "ec2-ela"
  }
}