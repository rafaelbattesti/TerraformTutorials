# First Terraform Configuration File

provider "aws" {
    region     = "${var.aws_region}"
    access_key = "${var.aws_key}"  
    secret_key = "${var.aws_secret}"
}

resource "aws_instance" "web" {
    ami                    = "ami-0ef6235c4ed871e29" # Ubuntu Trusty 14.04 amd64 hvm:ebs
    instance_type          = "t2.micro"
    subnet_id              = "subnet-04b5f928"
    vpc_security_group_ids = ["sg-948305e4"]

    tags {
        "Identity" = "rbattesti.test.terraform"
        "Name"     = "RB Terraform Test"
    }
}
