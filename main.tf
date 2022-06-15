terraform {
  # backend "s3" {
  #   bucket = "ce-session-tfstate-bucket"
  #   key = "state/terraform.tfstate"
  #   region = "us-east-1"
  #   encrypt = true
  #   profile = "customer-empathy"
  #   kms_key_id = "alias/tf-bucket-key"
  #   dynamodb_table = "terraform-state"
  # }
}

resource "aws_instance" "webapp" {
  ami = var.ec2_ami
  instance_type = "t2.micro"
  tags = {
    Name = "Webapp"
  }
}

resource "aws_instance" "postgres"  {
  ami = var.ec2_ami
  instance_type = "t2.micro"
  tags = {
    Name = "Postgres"
  }
}
