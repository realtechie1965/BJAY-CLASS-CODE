resource "aws_instance" "MyFirstInstnace" {
  count         = 3
  ami           = "ami-0f409bae3775dc8e5"
  instance_type = "t2.micro"

  tags = {
    Name = "demoinstnce-${count.index}"
  }
}