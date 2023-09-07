resource "aws_key_pair" "realtechie_key" {
    key_name = "realtechie_key"
    public_key = file(var.PATH_TO_PUBLIC_KEY)
}

resource "aws_instance" "MyFirstInstnace" {
  ami           = lookup(var.AMIS, var.AWS_REGION)
  instance_type = "t2.micro"
  key_name      = aws_key_pair.realtechie_key.key_name

  vpc_security_group_ids = [aws_security_group.realtechie-sg.id]
  subnet_id = aws_subnet.realtechiePub-Sub1.id

  user_data = file("installapache.sh")

  tags = {
    Name = "instance-EBS"
  }

}

#EBS resource Creation
resource "aws_ebs_volume" "ebs-volume-1" {
  availability_zone = "us-east-1a"
  size              = 50
  type              = "gp2"

  tags = {
    Name = "Secondary Volume Disk"
  }
}

output "public_ip" {
  value = aws_instance.MyFirstInstnace.public_ip 
}

#TO CREATE SSH-KEYGEN
#ssh-keygen -f <keyname>

