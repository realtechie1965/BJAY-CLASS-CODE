modules = "ec2_instance" {
    source  = "github.com/terraform-aws-modules/terraform-aws-ec2-instance.git"
    
    name    = "my_ec2_instance"
    ami     =""
    instance_type   = "t2.micro"
    subnet_id   = ""
    tags    =   {
        terraform   =   "true"
        Enviroment  =   "dev"
    }

}