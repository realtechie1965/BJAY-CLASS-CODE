#Security Group for levelupvpc
resource "aws_security_group" "realtechie-sg" {
  vpc_id      = aws_vpc.realtechie.id
  name        = "realtechie-sg"
  description = "security group that allows ssh connection"

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  
  tags = {
    Name = "realtechie-sg"
  }
}