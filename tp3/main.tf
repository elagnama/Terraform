resource "aws_security_group" "ela-sg" {
  name        = "ela-sg"
  description = "Allow http, https and ssh inbound traffic"

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"] # adresses autorisées à accéder à ce port
  }
  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  ingress {
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}


resource "aws_instance" "ela-ec2" {
  ami             = data.aws_ami.my_ami.id
  instance_type   = var.instance_type
  key_name        = "devops-ela"
  tags            = var.aws_common_tags
  security_groups = ["ela-sg"]
}

resource "aws_eip" "load_balancer_ip" {
  instance = aws_instance.ela-ec2.id
}