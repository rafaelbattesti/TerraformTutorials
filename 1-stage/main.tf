# First Terraform Configuration File

provider "aws" {
    region     = "${var.aws_region}"
    access_key = "${var.aws_key}"  
    secret_key = "${var.aws_secret}"
}

resource "aws_security_group" "allow-icmp" {
  name        = "allow-icmp"
  description = "Allow icmp inbound traffic - ping"

  ingress {
    from_port   = -1
    to_port     = -1
    protocol    = "icmp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags {
    Name = "Allow icmp inbound traffic"
  }
}
resource "aws_instance" "web" {
    ami                    = "ami-0ef6235c4ed871e29" # Ubuntu Trusty 14.04 amd64 hvm:ebs
    instance_type          = "t2.micro"
    subnet_id              = "subnet-04b5f928"
    vpc_security_group_ids = ["${aws_security_group.allow-icmp.id}"]

    tags {
        "Identity" = "rbattesti-test-terraform"
        "Name"     = "RB Terraform Test"
    }
}

output "public_ip" {
    value = "${aws_instance.web.public_ip}"
}

output "public_dns" {
    value = "${aws_instance.web.public_dns}"
}
